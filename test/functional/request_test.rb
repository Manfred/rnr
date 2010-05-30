require File.expand_path('../../start', __FILE__)
require 'uri'

class RequestTest < Net::HTTP::TestCase
  
  test "generates a request" do
    request = Net::HTTP::Request.new(:get, URI.parse('http://www.w3.org/pub/WWW/TheProject.html'), {
      'user-agent' => 'Ruby/1.8.7',
      'accept' => '*.*'
    })
    
    message = request.to_s
    assert_equal "GET /pub/WWW/TheProject.html HTTP/1.1\r\n", message[0,39]
    assert_equal "Host: www.w3.org\r\nAccept: *.*\r\nUser-Agent: Ruby/1.8.7\r\n\r\n", message[39..-1]
  end
end