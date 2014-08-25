require_relative '../start'
require 'uri'

class RequestTest < Net::HTTP::TestCase
  test "supports URI's with a blank path" do
    request = Net::HTTP::Request.new(:get, URI.parse('http://www.w3.org'))
    assert_equal '/', request.request_uri
  end

  test "supports URI's with an SSL port" do
    request = Net::HTTP::Request.new(:get, URI.parse('https://www.w3.org'))
    assert_equal 443, request.port
  end

  test "supports URI's with a different port" do
    request = Net::HTTP::Request.new(:get, URI.parse('http://www.w3.org:8034'))
    assert_equal 8034, request.port
  end

  test "reads response in parts" do
    FakeSocket.chunks = [
      "HTTP/1.",
      "1 200 OK\r\n",
      "Date: Sun, 25 Apr 201",
      "0 12:17:38 GMT\r\n",
      "Server: Apache/2.",
      "2.14 (Unix) mod_ssl/2",
      ".2.14 OpenSSL/0.9",
      ".8l DAV/2 Phusion_Passenger/2.2.11\r\n",
      "Content-Length: 44\r\n",
      "Content-Type: text/html\r\n",
      "\r\n",
      "<html><body><h1>It works!</h1></body></html>\r\n"
    ]
    request = Net::HTTP::Request.new(:get, URI.parse('http://www.w3.org'))
    response = request.perform
    assert_equal('1.1', response.http_version)
    assert_equal(200, response.status_code)
    assert_equal('OK', response.reason_phrase)
    assert_equal({
      "date"=>"Sun, 25 Apr 2010 12:17:38 GMT",
      "server"=>"Apache/2.2.14 (Unix) mod_ssl/2.2.14 OpenSSL/0.9.8l DAV/2 Phusion_Passenger/2.2.11",
      "content-length"=>"44",
      "content-type"=>"text/html"
    }, response.headers)
    assert_equal("<html><body><h1>It works!</h1></body></html>\r\n", response.body)
  end
end
