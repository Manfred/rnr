module Net
  class HTTP
    class Response
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
      
      def parse(input)
        Net::HTTP::HTTP_1_1_Parser.new(self).parse(input)
      end
      
      def self.parse(input)
        response = new
        response.parse(input)
        response
      end
    end
  end
end