module Net
  class HTTP
    class HTTP_1_1_RequestParser
      
      %%{
        
        machine http_1_1_request_parser;
        
        action mark { mark = p }
        action verb { parser.handle_verb(data, mark, p) }
        action request_uri { parser.handle_request_uri(data, mark, p) }
        action http_version { parser.handle_version(data, mark, p) }
        
        action start_field_name { start_field_name = p }
        action end_field_name { parser.handle_field_name(data, start_field_name, p) }
        action start_field_value { start_field_value = p }
        action end_field_value { parser.handle_field_value(data, start_field_value, p) }
        
        action start_body { mark = p }
        action end_body { parser.handle_body(data, mark, p) }
        
        action done { parser.done!(data, p) }
        
        CRLF       = "\r\n";
        CTL        = (cntrl | 127);
        SP         = 32;
        HT         = 9;
        separators = ( "(" | ")" | "<" | ">" | "@" | "," | ";" | ":" | "\\" | "\"" | "/" | "[" | "]" | "?" | "=" | "{" | "}" | SP | HT);
        
        token      = (ascii -- (CTL | separators));
        
        verb = (ascii -- SP)+ >mark %verb;
        request_uri = (ascii -- SP)+ >mark %request_uri;
        http_number  = (digit+ "." digit+);
        http_version = ("HTTP/" http_number) >mark %http_version;
        request_line = verb SP request_uri SP http_version :> CRLF;
                
        field_name = token+ >start_field_name %end_field_name;
        field_value = any* >start_field_value %end_field_value;
        message_header = field_name ":" SP* field_value :> CRLF;
        
        main   := request_line (message_header)* (CRLF @done);
      }%%
      
      %% write data;
      
      def self.http_1_1_request_parser_parse(parser, data)
        if parser.cs.nil?
          %% write init;
        else
          cs = parser.cs
        end
        
        p   = parser.p
        pe  = data.length
        eof = parser.eof
        
        %% write exec;
        
        parser.cs = cs
        parser.p  = p
      end
      
      attr_accessor :p, :cs, :eof, :data, :mark
      attr_accessor :request
      attr_accessor :done
      
      def initialize(request)
        @p       = 0
        @cs      = nil
        @eof     = -1
        @data    = []
        
        @done    = false
        @request = request
      end
      
      def parse(input)
        if @done
          handle_body(input)
        else
          @data.concat(input.kind_of?(String) ? input.unpack('C*') : input)
          self.class.http_1_1_request_parser_parse(self, @data)
        end
      end
      
      def handle_verb(data, mark, pointer)
        verb = self.class.join(data, mark, pointer)
        request.verb = verb.downcase.to_sym
      end
      
      def handle_request_uri(data, mark, pointer)
        request.request_uri = self.class.join(data, mark, pointer)
      end
      
      def handle_version(data, mark, pointer)
        version = self.class.join(data, mark, pointer)
        request.http_version = version.split('/').last
      end
      
      def handle_field_name(data, mark, pointer)
        @last_field_name = self.class.join(data, mark, pointer-1).downcase
      end
      
      def handle_field_value(data, mark, pointer)
        if @last_field_name
          value = self.class.join(data, mark, pointer)
          request.headers[@last_field_name] = value
        end
      end
      
      def handle_body(input)
        request.body ||= ''
        request.body << input
      end
      
      def done!(data, pointer)
        @done = true
        handle_body(self.class.join(data, pointer, -1))
      end
      
      def self.join(data, mark, pointer)
        data[mark..pointer].pack('C*').strip
      end
    end
  end
end
