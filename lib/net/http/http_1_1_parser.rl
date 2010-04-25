module Net
  class HTTP
    class HTTP_1_1_Parser
      %%{
        machine http_1_1_parser;
        
        action mark { @mark = p }
        action http_version { parser.handle_version(data[@mark..cs].pack('C*')) }
        
        CRLF       = "\r\n";
        CTL        = (cntrl | 127);
        SP         = 32;
        HT         = 9;
        separators = ( "(" | ")" | "<" | ">" | "@" | "," | ";" | ":" | "\\" | "\"" | "/" | "[" | "]" | "?" | "=" | "{" | "}" | SP | HT);
        
        token      = (ascii -- (CTL | separators));
        
        http_number  = (digit+ "." digit+);
        http_version = ("HTTP/" http_number) >mark %http_version;
        
        main   := http_version;
      }%%
      
      %% write data;
      
      def self.http_1_1_parser_parse(parser, data)
        eof  = data.length
        data = data.unpack("c*") if data.is_a?(String)
        %% write init;
        %% write exec;
      end
      
      attr_accessor :http_version
      
      def parse(input)
        self.class.http_1_1_parser_parse(self, input)
      end
      
      def handle_version(version)
        self.http_version = version.split('/').last
      end
    end
  end
end
