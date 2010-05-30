require File.expand_path('../../start', __FILE__)
require 'uri'

class MethodsTest < Net::HTTP::TestCase
  test "has a GET shortcut" do
    response = Net::HTTP::Response.new
    response.status_code = 200
    response.reason_phrase = 'OK'
    
    FakeSocket.chunks = [response.to_s]
    
    response = Net::HTTP.get(URI.parse('http://www.w3.org/poedels'))
    p response
  end
end