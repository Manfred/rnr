module Net
  class HTTP
    autoload :Response,        'http/response'
    autoload :Request,         'http/request'
    autoload :HTTP_1_1_Parser, 'http/http_1_1_parser'
  end
end