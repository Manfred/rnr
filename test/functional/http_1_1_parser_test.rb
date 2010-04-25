require File.expand_path('../../start', __FILE__)

class ResponseTest < Net::HTTP::TestCase
  test "parses the HTTP version" do
    parser = Net::HTTP::HTTP_1_1_Parser.new
    parser.parse('HTTP/1.1')
    assert_equal '1.1', parser.http_version
  end
end