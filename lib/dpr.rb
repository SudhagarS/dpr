require "dpr/version"
require 'uri'
require 'unirest'

class String
  def http_get params: {}, headers: {}
    to_resp 'get', headers, params
  end

  def http_post params: {}, headers: {}
    to_resp 'post', headers, params
  end

  def http_delete params: {}, headers: {}
    to_resp 'delete', headers, params
  end

  def http_put params: {}, headers: {}
    to_resp 'put', headers, params
  end

  def http_patch params: {}, headers: {}
    to_resp 'patch', headers, params
  end

  def valid_url?
    uri = URI.parse self
    uri.kind_of? URI::HTTP
  rescue URI::InvalidURIError
    false
  end

  private
  def to_resp http_method, headers, params
    if valid_url?
      response = Unirest.send http_method, self, headers: headers, parameters: params
      return response.body, response.code
    else
      return {}, -1
    end
  end

end
