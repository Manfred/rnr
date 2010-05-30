module Net
  class HTTP
    module Methods
      def get(url, headers={}, options={})
        Net::HTTP::Request.new(:get, url, headers, nil, options).perform
      end
      
      def head(url, headers={}, options={})
        Net::HTTP::Request.new(:head, url, headers, nil, options).perform
      end
      
      def post(url, headers={}, body=nil, options={})
        Net::HTTP::Request.new(:post, url, headers, body, options).perform
      end
      
      def put(url, headers={}, body=nil, options={})
        Net::HTTP::Request.new(:put, url, headers, body, options).perform
      end
      
      def delete(url, headers={}, options={})
        Net::HTTP::Request.new(:delete, url, headers, nil, options).perform
      end
    end
  end
end