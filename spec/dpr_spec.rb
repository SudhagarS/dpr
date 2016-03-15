require 'spec_helper'
require 'pry'

describe Dpr do
  it 'has a version number' do
    expect(Dpr::VERSION).not_to be nil
  end

  it 'does get request' do
    resp, code = "http://httpbin.org/get".http_get
    expect(resp['url']).to eq('http://httpbin.org/get')
    expect(code).to eq(200)
  end

  it 'does put request' do
    resp, code = "http://httpbin.org/put".http_put
    expect(resp['url']).to eq('http://httpbin.org/put')
    expect(code).to eq(200)
  end

  it 'does delete request' do
    resp, code = "http://httpbin.org/delete".http_delete
    expect(resp['url']).to eq('http://httpbin.org/delete')
    expect(code).to eq(200)
  end

  it 'does post request' do
    resp, code = "http://httpbin.org/post".http_post params: {'h': 'hello'}
    expect(resp['url']).to eq('http://httpbin.org/post')
    expect(resp['form']['h']).to eq 'hello'
    expect(code).to eq(200)
  end

  it 'does headers and params right' do
    resp, code = "http://httpbin.org/get?h=hello".http_get params: {'w': 'world'}, headers: { "h" => "header" }
    expect(resp['url']).to eq('http://httpbin.org/get?h=hello&w=world')
    expect(resp['args']['h']).to eq 'hello'
    expect(resp['args']['w']).to eq 'world'
    expect(resp['headers']['H']).to eq 'header'
    expect(code).to eq(200)
  end

  it 'throws error when url is invalid' do
    resp, code = "adsa".http_get
    expect(resp).to eq({})
    expect(code).to eq(-1)
  end

  it 'returns empty hash for invalid url' do
    resp, code = "asdasd".http_get
    expect(resp).to eq({})
    expect(code).to eq(-1)
  end
end
