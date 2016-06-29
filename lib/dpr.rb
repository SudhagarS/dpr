require "dpr/version"
require 'uri'
require 'rest-client'
require 'json'
require 'addressable/uri'


class String
  TIMEOUT = 10

  def http_get params: {}, headers: {}, timeout: TIMEOUT
    to_resp method: :get, headers: headers, params: params, timeout: timeout
  end

  def http_post params: {}, headers: {}, timeout: TIMEOUT
    to_resp method: :post, headers: headers, params: params, timeout: timeout
  end

  def http_delete params: {}, headers: {}, timeout: TIMEOUT
    to_resp method: :delete, headers: headers, params: params, timeout: timeout
  end

  def http_put params: {}, headers: {}, timeout: TIMEOUT
    to_resp method: :put, headers: headers, params: params, timeout: timeout
  end

  def http_patch params: {}, headers: {}, timeout: TIMEOUT
    to_resp method: :patch, headers: headers, params: params, timeout: timeout
  end

  def to_resp method: :get, headers: {}, params: {}, timeout: TIMEOUT
    if self =~ URI.regexp
      begin
        case method
          when :get
            url = self
            if params.is_a?(Hash) && params.length > 0
              if url.include? "?"
                url += "&"
              else
                url += "?"
              end
              uri = Addressable::URI.new
              uri.query_values = params
              url += uri.query
              url = url.gsub(/\s+/, '%20')
            end
            http_response = RestClient::Request.execute(:method => :get, :url => url, :headers => headers, :timeout => timeout)
          when :post
            http_response = RestClient::Request.execute(:method => :post, :url => self, :payload => params.to_json, :headers => headers, :timeout => timeout)
          when :put
            http_response = RestClient::Request.execute(:method => :put, :url => self, :payload => params, :headers => headers, :timeout => timeout)
          when :delete
            http_response = RestClient::Request.execute(:method => :delete, :url => self, :payload => params, :headers => headers, :timeout => timeout)
          when :patch
            http_response = RestClient::Request.execute(:method => :patch, :url => self, :payload => params, :headers => headers, :timeout => timeout)
        end
       rescue RestClient::RequestTimeout
         raise 'Request Timeout'
       rescue RestClient::Exception => e
         http_response = e.response
      end

      begin
        return JSON.parse(http_response.body), http_response.code
      rescue JSON::ParserError
        return {response: http_response.body}, http_response.code
      end
    else
      return {}, -1
    end
  end

end
