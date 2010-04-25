require File.expand_path('../../start', __FILE__)

class ResponseTest < Net::HTTP::TestCase
  test "parses the status line" do
    parser = Net::HTTP::HTTP_1_1_Parser.new
    parser.parse("HTTP/1.1 200 OK\r\n")
    assert_equal '1.1', parser.http_version
    assert_equal 200, parser.status_code
    assert_equal 'OK', parser.reason_phrase
  end
end