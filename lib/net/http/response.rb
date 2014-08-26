module Net
  class HTTP
    class Response
      include Net::HTTP::BufferedParsing
      
      attr_accessor :http_version, :status_code, :reason_phrase
      attr_accessor :headers
      attr_accessor :body
      
      def initialize
        @http_version = '1.1'
        @headers      = {}
      end
      
      def to_s
        Net::HTTP::HTTP_1_1_ResponseGenerator.new(self).to_s
      end
      
      def parser
        @parser ||= Net::HTTP::HTTP_1_1_ResponseParser.new(self)
      end
      
      def self.parse(input)
        response = new
        response.parse(input)
        response.finalize
        response
      end
    end
  end
end