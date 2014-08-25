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
      
      def port
        url.port
      end
      
      def request_uri
        [url.path == '' ? '/' : url.path, url.query].compact.join('?')
      end
      
      def to_s
        Net::HTTP::HTTP_1_1_RequestGenerator.new(self).to_s
      end
      
      def socket
        @socket ||= TCPSocket.open(hostname, port)
      end
      
      def response
        @response ||= Net::HTTP::Response.new
      end
      
      def perform
        socket.write(to_s)
        while (data = socket.read(1024))
          response.parse(data)
        end
        response.finalize
        response
      end
    end
  end
end