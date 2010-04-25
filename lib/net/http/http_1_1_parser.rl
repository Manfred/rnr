module Net
  class HTTP
    class HTTP_1_1_Parser
      
      %%{
        machine http_1_1_parser;
        
        action mark { mark = p }
        action http_version { parser.handle_version(data, mark, p) }
        action status_code { parser.handle_status_code(data, mark, p) }
        action reason_phrase { parser.handle_reason_phrase(data, mark, p) }
        
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
        status_line = http_version SP status_code SP reason_phrase CRLF;
        
        main   := status_line;
      }%%
      
      %% write data;
      
      def self.http_1_1_parser_parse(parser, data)
        eof  = data.length
        data = data.unpack("c*") if data.is_a?(String)
        %% write init;
        %% write exec;
      end
      
      attr_accessor :data, :mark
      attr_accessor :http_version, :status_code, :reason_phrase
      
      def parse(data)
        self.class.http_1_1_parser_parse(self, data)
      end
      
      def handle_version(data, mark, pointer)
        version = self.class.join(data, mark, pointer)
        self.http_version = version.split('/').last
      end
      
      def handle_status_code(data, mark, pointer)
        status_code = self.class.join(data, mark, pointer)
        self.status_code = status_code.to_i
      end
      
      def handle_reason_phrase(data, mark, pointer)
        reason_phrase = self.class.join(data, mark, pointer)
        self.reason_phrase = reason_phrase
      end
      
      def self.join(data, mark, pointer)
        data[mark..pointer].pack('C*').strip
      end
    end
  end
end
