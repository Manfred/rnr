require_relative '../start'
require 'uri'

class MethodsTest < Net::HTTP::TestCase
  def setup
    response = Net::HTTP::Response.new
    response.status_code = 200
    response.reason_phrase = 'OK'
    FakeSocket.chunks = [response.to_s]
  end
  
  test "has a GET shortcut" do
    @response = Net::HTTP.get(URI.parse('http://www.example.com/resource'))
    run_assertions
  end
  
  test "has a HEAD shortcut" do
    @response = Net::HTTP.head(URI.parse('http://www.example.com/resource'))
    run_assertions
  end
  
  test "has a POST shortcut" do
    @response = Net::HTTP.post(URI.parse('http://www.example.com/resource'))
    run_assertions
  end
  
  test "has a PUT shortcut" do
    @response = Net::HTTP.put(URI.parse('http://www.example.com/resource'))
    run_assertions
  end
  
  test "has a DELETE shortcut" do
    @response = Net::HTTP.delete(URI.parse('http://www.example.com/resource'))
    run_assertions
  end
  
  
  private
  
  def run_assertions
    assert_equal 200, @response.status_code
    assert_equal 'OK', @response.reason_phrase
  end
end