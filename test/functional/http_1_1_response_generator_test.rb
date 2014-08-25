require_relative '../start'

class HTTP_1_1_ResponseGeneratorTest < Net::HTTP::TestCase
  attr_accessor :http_version, :status_code, :reason_phrase
  attr_accessor :headers
  attr_accessor :body
  
  def setup
    @http_version  = '1.1'
    @status_code   = 401
    @reason_phrase = 'Forbidden'
    @body          = "Sorry, you're not welcome here ):"
    
    @headers = {
      'etag'           => '"46e284-fae-47f26f9d7d900"',
      'last-modified'  => 'Tue, 09 Feb 2010 08:48:04 GMT',
      'content-length' => @body.length
    }
  end
  
  test "generates an http version" do
    assert_equal "HTTP/1.1", generator.http_version
  end
  
  test "generates a status line" do
    assert_equal "HTTP/1.1 401 Forbidden", generator.status_line
  end
  
  test "generates headers" do
    assert_equal "ETag: \"46e284-fae-47f26f9d7d900\"\r\nLast-Modified: Tue, 09 Feb 2010 08:48:04 GMT\r\nContent-Length: 33", generator.serialized_headers
  end
  
  test "generates" do
    assert_equal "HTTP/1.1 401 Forbidden\r\nETag: \"46e284-fae-47f26f9d7d900\"\r\nLast-Modified: Tue, 09 Feb 2010 08:48:04 GMT\r\nContent-Length: 33\r\n\r\nSorry, you're not welcome here ):", generator.to_s
  end
  
  private
  
  def generator
    @generator ||= Net::HTTP::HTTP_1_1_ResponseGenerator.new(self)
  end
end