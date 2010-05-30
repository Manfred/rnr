require File.expand_path('../../start', __FILE__)

class HTTP_1_1_RequestGeneratorTest < Net::HTTP::TestCase
  attr_accessor :verb, :request_uri, :hostname, :http_version
  attr_accessor :headers
  attr_accessor :body
  
  def setup
    @verb         = 'GET'
    @request_uri  = '/pub/WWW/TheProject.html'
    @hostname     = 'www.w3.org'
    @http_version = '1.1'
    @headers      = {
      'accept'       => '*.*',
      'max-forwards' => 0
    }
  end
  
  test "generates a request line" do
    assert_equal "GET /pub/WWW/TheProject.html HTTP/1.1", generator.request_line
  end
  
  test "generates headers" do
    assert_equal "Host: www.w3.org\r\nAccept: *.*\r\nMax-Forwards: 0", generator.serialized_headers
  end
  
  test "generates" do
    assert_equal "GET /pub/WWW/TheProject.html HTTP/1.1\r\nHost: www.w3.org\r\nAccept: *.*\r\nMax-Forwards: 0\r\n\r\n", generator.to_s
  end
  
  private
  
  def generator
    @generator ||= Net::HTTP::HTTP_1_1_RequestGenerator.new(self)
  end
end