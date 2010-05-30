require File.expand_path('../../start', __FILE__)
require 'uri'

class MethodsTest < Net::HTTP::TestCase
  test "has a GET shortcut" do
    response = Net::HTTP::Response.new
    response.status_code = 200
    response.reason_phrase = 'OK'
    
    FakeSocket.chunks = [response.to_s]
    
    # We're stubbing the socket so the requested URI doesn't matter
    response = Net::HTTP.get(URI.parse('http://www.example.com/resource'))
    
    assert_equal 200, response.status_code
    assert_equal 'OK', response.reason_phrase
  end
end