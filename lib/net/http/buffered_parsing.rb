module Net
  class HTTP
    module BufferedParsing
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
    end
  end
end