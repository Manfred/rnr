require_relative '../start'
require 'uri'

class RequestTest < Net::HTTP::TestCase
  test "supports URI's with a blank path" do
    request = Net::HTTP::Request.new(:get, URI.parse('http://www.w3.org'))
    assert_equal '/', request.request_uri
  end
end