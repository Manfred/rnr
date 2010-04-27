module Net
  class HTTP
    class Request
      attr_accessor :verb, :request_uri, :http_version
      attr_accessor :headers
      attr_accessor :body
      
      def initialize
        self.http_version = '1.1'
        self.headers      = {}
      end
      
      def to_s
        Net::HTTP::HTTP_1_1_Generator.new(self).to_s
      end
    end
  end
end