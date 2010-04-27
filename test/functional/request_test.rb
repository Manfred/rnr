require File.expand_path('../../start', __FILE__)

class RequestTest < Net::HTTP::TestCase
  
  test "generates a request" do
    request = Net::HTTP::Request.new
    request.verb        = 'GET'
    request.request_uri = '/pub/WWW/TheProject.html'
    request.headers     = {
      'user-agent' => 'Ruby/1.8.7',
      'host' => 'www.w3.org',
      'accept' => '*.*'
    }
    
    message = request.to_s
    assert_equal "GET /pub/WWW/TheProject.html HTTP/1.1\r\n", message[0,39]
    assert_equal "Accept: *.*\r\nUser-Agent: Ruby/1.8.7\r\nHost: www.w3.org\r\n\r\n", message[39..-1]
  end
end