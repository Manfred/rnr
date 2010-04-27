module Net
  class HTTP
    CRLF = "\r\n"
    
    GENERAL_HEADER_FIELDS = ['Cache-Control', 'Connection', 'Date', 'Pragma', 'Trailer', 'Transfer-Encoding', 'Upgrade', 'Via', 'Warning']
    REQUEST_HEADER_FIELDS = ['Accept', 'Accept-Charset', 'Accept-Encoding', 'Accept-Language', 'Authorization', 'Expect', 'From', 'Host', 'If-Match', 'If-Modified-Since', 'If-None-Match', 'If-Range', 'If-Unmodified-Since', 'Max-Forwards', 'Proxy-Authorization', 'Range', 'Referer', 'TE', 'User-Agent']
    RESPONSE_HEADER_FIELDS = ['Accept-Ranges', 'Age', 'ETag', 'Location', 'Proxy-Authenticate', 'Retry-After', 'Server', 'Vary', 'WWW-Authenticate']
    ENTITY_HEADER_FIELDS = ['Allow', 'Content-Encoding', 'Content-Language', 'Content-Length', 'Content-Location', 'Content-MD5', 'Content-Range', 'Content-Type', 'Expires', 'Last-Modified']
    
    HEADER_MAP = (GENERAL_HEADER_FIELDS + REQUEST_HEADER_FIELDS + RESPONSE_HEADER_FIELDS + ENTITY_HEADER_FIELDS).inject({}) { |map, header| map[header.downcase] = header; map }
    
    autoload :Response,           'net/http/response'
    autoload :Request,            'net/http/request'
    autoload :HTTP_1_1_Generator, 'net/http/http_1_1_generator'
    autoload :HTTP_1_1_Parser,    'net/http/http_1_1_parser'
  end
end