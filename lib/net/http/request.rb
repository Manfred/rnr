require 'socket'

module Net
  class HTTP
    class Request
      attr_accessor :verb, :url, :headers, :body, :options
      attr_accessor :http_version
      
      def initialize(verb=nil, url=nil, headers={}, body=nil, options={})
        @http_version = '1.1'
        @headers      = headers
        
        @verb    = verb
        @url     = url
        @body    = body
        @options = options
      end
      
      def hostname
        url.host
      end
      
      def request_uri
        [url.path == '' ? '/' : url.path, url.query].compact.join('?')
      end
      
      def to_s
        Net::HTTP::HTTP_1_1_RequestGenerator.new(self).to_s
      end
      
      def socket
        @socket ||= TCPSocket.open(hostname, 80)
      end
      
      def perform
        socket.write(to_s)
        Net::HTTP::Response.parse(socket.read)
      end
    end
  end
end