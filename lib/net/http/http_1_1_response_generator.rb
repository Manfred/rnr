module Net
  class HTTP
    class HTTP_1_1_ResponseGenerator
      attr_accessor :response
      
      def initialize(response)
        self.response = response
      end
      
      def http_version
        ['HTTP', response.http_version].join('/')
      end
      
      def status_line
        [http_version, response.status_code, response.reason_phrase].join(' ')
      end
      
      def serialized_headers
        serialized = []
        for key, value in response.headers
          serialized << [
            Net::HTTP::HEADER_MAP[key] || key.capitalize,
            value
          ].join(': ')
        end
        serialized.join(CRLF)
      end
      
      def to_s
        [
          status_line, serialized_headers, nil, response.body
        ].join(CRLF)
      end
    end
  end
end