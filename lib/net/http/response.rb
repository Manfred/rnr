module Net
  class HTTP
    class Response
      attr_accessor :http_version, :status_code, :reason_phrase
      attr_accessor :headers
      attr_accessor :body
      
      def initialize
        self.headers = {}
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