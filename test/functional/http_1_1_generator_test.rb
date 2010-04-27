require File.expand_path('../../start', __FILE__)

class HTTP_1_1_GeneratorTest < Net::HTTP::TestCase
  attr_accessor :verb, :request_uri, :http_version
  attr_accessor :headers
  attr_accessor :body
  
  def setup
    @verb         = 'GET'
    @request_uri  = '/pub/WWW/TheProject.html'
    @http_version = '1.1'
    @headers      = {
      'accept'       => '*.*',
      'host'         => 'www.w3.org',
      'max-forwards' => 0
    }
  end
  
  test "generates a request line" do
    assert_equal "GET /pub/WWW/TheProject.html HTTP/1.1", generator.request_line
  end
  
  test "generates headers" do
    assert_equal "Accept: *.*\r\nMax-Forwards: 0\r\nHost: www.w3.org", generator.serialized_headers
  end
  
  test "generates" do
    assert_equal "GET /pub/WWW/TheProject.html HTTP/1.1\r\nAccept: *.*\r\nMax-Forwards: 0\r\nHost: www.w3.org\r\n\r\n", generator.to_s
  end
  
  private
  
  def generator
    @generator ||= Net::HTTP::HTTP_1_1_Generator.new(self)
  end
end