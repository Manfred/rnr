module Net
  class HTTP
    module Methods
      def get(url=nil, headers={}, body=nil, options={})
        request = Net::HTTP::Request.new(:get, url, headers, body, options)
        request.perform
      end
    end
  end
end