module Net
  class HTTP
    class HTTP_1_1_Parser
      
      %%{
        machine http_1_1_parser;
        
        action mark { mark = p }
        action http_version { parser.handle_version(data, mark, p) }
        action status_code { parser.handle_status_code(data, mark, p) }
        action reason_phrase { parser.handle_reason_phrase(data, mark, p) }
        
        action start_field_name { start_field_name = p }
        action end_field_name { parser.handle_field_name(data, start_field_name, p) }
        action start_field_value { start_field_value = p }
        action end_field_value { parser.handle_field_value(data, start_field_value, p) }
        
        action done { parser.done! }
        
        CRLF       = "\r\n";
        CTL        = (cntrl | 127);
        SP         = 32;
        HT         = 9;
        separators = ( "(" | ")" | "<" | ">" | "@" | "," | ";" | ":" | "\\" | "\"" | "/" | "[" | "]" | "?" | "=" | "{" | "}" | SP | HT);
        
        token      = (ascii -- (CTL | separators));
        
        http_number  = (digit+ "." digit+);
        http_version = ("HTTP/" http_number) >mark %http_version;
        status_code = digit+ >mark %status_code;
        reason_phrase = (any -- CRLF)+ >mark %reason_phrase;
        status_line = http_version SP status_code SP reason_phrase :> CRLF;
        
        field_name = token+ >start_field_name %end_field_name;
        field_value = any* >start_field_value %end_field_value;
        message_header = field_name ":" SP* field_value :> CRLF;
        
        main   := status_line (message_header)* (CRLF @done);
      }%%
      
      %% write data;
      
      def self.http_1_1_parser_parse(parser, data)
        eof  = data.length
        data = data.unpack("c*") if data.is_a?(String)
        %% write init;
        %% write exec;
      end
      
      attr_accessor :data, :mark
      attr_accessor :response
      attr_accessor :done
      
      def initialize(response)
        self.response = response
        self.done = false
      end
      
      def parse(data)
        self.class.http_1_1_parser_parse(self, data)
      end
      
      def handle_version(data, mark, pointer)
        version = self.class.join(data, mark, pointer)
        response.http_version = version.split('/').last
      end
      
      def handle_status_code(data, mark, pointer)
        status_code = self.class.join(data, mark, pointer)
        response.status_code = status_code.to_i
      end
      
      def handle_reason_phrase(data, mark, pointer)
        reason_phrase = self.class.join(data, mark, pointer)
        response.reason_phrase = reason_phrase
      end
      
      def handle_field_name(data, mark, pointer)
        @last_field_name = self.class.join(data, mark, pointer-1).downcase
      end
      
      def handle_field_value(data, mark, pointer)
        if @last_field_name
          value = self.class.join(data, mark, pointer)
          response.headers[@last_field_name] = value
        end
      end
      
      def done!
        self.done = true
      end
      
      def self.join(data, mark, pointer)
        data[mark..pointer].pack('C*').strip
      end
    end
  end
end
