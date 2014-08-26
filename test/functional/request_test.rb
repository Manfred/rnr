require_relative '../start'
require 'uri'

class RequestTest < Net::HTTP::TestCase
  test "generates a request" do
    request = Net::HTTP::Request.new(:get, URI.parse('http://www.w3.org/pub/WWW/TheProject.html'), {
      'user-agent' => 'Ruby/1.8.7',
      'accept' => '*.*'
    })
    
    message = request.to_s
    assert_equal "GET /pub/WWW/TheProject.html HTTP/1.1\r\n", message[0,39]
    
    headers = Hash[message[39..-1].split("\r\n").map { |l| l.split(':', 2) }]
    assert_equal 'www.w3.org', headers['Host'].strip
    assert_equal 'Ruby/1.8.7', headers['User-Agent'].strip
    assert_equal '*.*', headers['Accept'].strip
  end
  
  test "parses a request" do
    request = Net::HTTP::Request.parse(request('001'))
    
    assert_equal :get, request.verb
    assert_equal '/pub/WWW/TheProject.html', request.request_uri
    assert_equal '1.1', request.http_version
    
    assert_equal 'Ruby/1.8.7', request.headers['user-agent']
    assert_equal 'www.w3.org', request.headers['host']
    assert_equal '*/*', request.headers['accept']
    assert_equal '', request.body
  end
end