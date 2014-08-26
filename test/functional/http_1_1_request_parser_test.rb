require_relative '../start'

class HTTP_1_1_RequestParserTest < Net::HTTP::TestCase
  attr_accessor :verb, :request_uri, :http_version
  attr_accessor :headers
  attr_accessor :body
  
  def setup
    @parser = nil
    @lines = []
    @headers = {}
  end
  
  test "parses the request line" do
    send_request_line

    assert_equal :post, verb
    assert_equal '/pub/WWW/TheProject.html?a=1', request_uri
    assert_equal '1.1', http_version
  end
  
  test "parses headers" do
    send_request_line
    send_header
    send_header_end
    
    assert_equal 'www.w3.org', headers['host']
  end
  
  test "parses body" do
    send_request_line
    send_header
    send_header_end
    send_body
    
    assert_equal '{}', body
  end
  
  private
  
  def parser
    @parser ||= Net::HTTP::HTTP_1_1_RequestParser.new(self)
  end
  
  def send_request_line
    parser.parse "POST /pub/WWW/TheProject.html?a=1 HTTP/1.1\r\n"
  end
  
  def send_header
    parser.parse  "Host: www.w3.org\r\n"
  end
  
  def send_header_end
    parser.parse "\r\n"
  end
  
  def send_body
    parser.parse "{}"
  end
end