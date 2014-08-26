require_relative '../start'

class HTTP_1_1_ResponseParserTest < Net::HTTP::TestCase
  attr_accessor :http_version, :status_code, :reason_phrase
  attr_accessor :headers
  attr_accessor :body
  
  def setup
    @parser = nil
    @lines = []
    @headers = {}
  end
  
  test "parses the status line" do
    send_status_line
    
    assert_equal '1.1', http_version
    assert_equal 200, status_code
    assert_equal 'OK', reason_phrase
  end
  
  test "parses headers" do
    send_status_line
    send_header
    send_header_end
    
    assert_equal 'application/json; charset=utf-8', headers['content-type']
  end
  
  test "parses body" do
    send_status_line
    send_header
    send_header_end
    send_body
    
    assert_equal '{}', body
  end
  
  private
  
  def parser
    @parser ||= Net::HTTP::HTTP_1_1_ResponseParser.new(self)
  end
  
  def send_status_line
    parser.parse "HTTP/1.1 200 OK\r\n"
  end
  
  def send_header
    parser.parse  "Content-Type: application/json; charset=utf-8\r\n"
  end
  
  def send_header_end
    parser.parse "\r\n"
  end
  
  def send_body
    parser.parse "{}"
  end
end