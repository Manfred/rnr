module Net
  class HTTP
    class HTTP_1_1_RequestGenerator
      attr_accessor :request
      
      def initialize(request)
        self.request = request
      end
      
      def http_version
        ['HTTP', request.http_version].join('/')
      end
      
      def request_line
        [request.verb.to_s.upcase, request.request_uri, http_version].join(' ')
      end
      
      def serialized_headers
        serialized = [['Host', request.hostname].join(': ')]
        for key, value in request.headers
          serialized << [
            Net::HTTP::HEADER_MAP[key] || key.capitalize,
            value
          ].join(': ')
        end
        serialized.join(CRLF)
      end
      
      def to_s
        [
          request_line, serialized_headers, nil, request.body
        ].join(CRLF)
      end
    end
  end
end