module Net
  class HTTP
    autoload :Response,        'net/http/response'
    autoload :Request,         'net/http/request'
    autoload :HTTP_1_1_Parser, 'net/http/http_1_1_parser'
  end
end