require File.expand_path('../../start', __FILE__)

class ResponseTest < Net::HTTP::TestCase
  test "parses a response" do
    response = Net::HTTP::Response.parse(response('001'))
    
    assert_equal '1.1', response.http_version
    assert_equal 200, response.status_code
    assert_equal 'OK', response.reason_phrase
    
    assert_equal 'text/html', response.headers['content-type']
    assert_equal 'Apache/2.2.14 (Unix) mod_ssl/2.2.14 OpenSSL/0.9.8l DAV/2 Phusion_Passenger/2.2.11', response.headers['server']
    assert_equal 'Sun, 25 Apr 2010 12:17:38 GMT', response.headers['date']
    assert_equal '44', response.headers['content-length']
    assert_equal '<html><body><h1>It works!</h1></body></html>', response.body
  end
end