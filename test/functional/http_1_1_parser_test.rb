require File.expand_path('../../start', __FILE__)

class ResponseTest < Net::HTTP::TestCase
  attr_accessor :http_version, :status_code, :reason_phrase
  attr_accessor :headers
  
  def setup
    @lines = []
    @headers = {}
  end
  
  test "parses the status line" do
    send_status_line
    parse
    
    assert_equal '1.1', http_version
    assert_equal 200, status_code
    assert_equal 'OK', reason_phrase
  end
  
  test "parses headers" do
    send_status_line
    send_header
    send_header_end
    parse
    
    assert_equal 'application/json; charset=utf-8', headers['content-type']
  end
  
  private
  
  def parser
    @parser ||= Net::HTTP::HTTP_1_1_Parser.new(self)
  end
  
  def send_status_line
    @lines << "HTTP/1.1 200 OK"
  end
  
  def send_header
    @lines << "Content-Type: application/json; charset=utf-8"
  end
  
  def send_header_end
    @lines << nil
  end
  
  def parse
    parser.parse((@lines + [nil]).join("\r\n"))
  end
end