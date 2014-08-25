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
      
      def parser
        @parser ||= Net::HTTP::HTTP_1_1_Parser.new(self)
      end
      
      def parse(input)
        @buffer ||= ''
        @buffer.concat(input)
        parts = @buffer.split(Net::HTTP::CRLF, 2)
        if parts.length > 1
          parser.parse(parts[0] + Net::HTTP::CRLF)
          @buffer = parts[1]
        end
      end
      
      def finalize
        unless @buffer.nil?
          parser.parse(@buffer)
        end
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