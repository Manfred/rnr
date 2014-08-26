
# line 1 "lib/net/http/http_1_1_response_parser.rl"
module Net
  class HTTP
    class HTTP_1_1_ResponseParser
      
      
# line 42 "lib/net/http/http_1_1_response_parser.rl"

      
      
# line 13 "lib/net/http/http_1_1_response_parser.rb"
class << self
	attr_accessor :_http_1_1_response_parser_actions
	private :_http_1_1_response_parser_actions, :_http_1_1_response_parser_actions=
end
self._http_1_1_response_parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 8, 2, 6, 7
]

class << self
	attr_accessor :_http_1_1_response_parser_key_offsets
	private :_http_1_1_response_parser_key_offsets, :_http_1_1_response_parser_key_offsets=
end
self._http_1_1_response_parser_key_offsets = [
	0, 0, 1, 2, 3, 4, 5, 7, 
	10, 12, 15, 17, 20, 20, 21, 22, 
	38, 39, 55, 57, 58
]

class << self
	attr_accessor :_http_1_1_response_parser_trans_keys
	private :_http_1_1_response_parser_trans_keys, :_http_1_1_response_parser_trans_keys=
end
self._http_1_1_response_parser_trans_keys = [
	72, 84, 84, 80, 47, 48, 57, 46, 
	48, 57, 48, 57, 32, 48, 57, 48, 
	57, 32, 48, 57, 13, 10, 13, 33, 
	124, 126, 35, 39, 42, 43, 45, 46, 
	48, 57, 65, 90, 94, 122, 10, 33, 
	58, 124, 126, 35, 39, 42, 43, 45, 
	46, 48, 57, 65, 90, 94, 122, 13, 
	32, 13, 0
]

class << self
	attr_accessor :_http_1_1_response_parser_single_lengths
	private :_http_1_1_response_parser_single_lengths, :_http_1_1_response_parser_single_lengths=
end
self._http_1_1_response_parser_single_lengths = [
	0, 1, 1, 1, 1, 1, 0, 1, 
	0, 1, 0, 1, 0, 1, 1, 4, 
	1, 4, 2, 1, 0
]

class << self
	attr_accessor :_http_1_1_response_parser_range_lengths
	private :_http_1_1_response_parser_range_lengths, :_http_1_1_response_parser_range_lengths=
end
self._http_1_1_response_parser_range_lengths = [
	0, 0, 0, 0, 0, 0, 1, 1, 
	1, 1, 1, 1, 0, 0, 0, 6, 
	0, 6, 0, 0, 0
]

class << self
	attr_accessor :_http_1_1_response_parser_index_offsets
	private :_http_1_1_response_parser_index_offsets, :_http_1_1_response_parser_index_offsets=
end
self._http_1_1_response_parser_index_offsets = [
	0, 0, 2, 4, 6, 8, 10, 12, 
	15, 17, 20, 22, 25, 26, 28, 30, 
	41, 43, 54, 57, 59
]

class << self
	attr_accessor :_http_1_1_response_parser_indicies
	private :_http_1_1_response_parser_indicies, :_http_1_1_response_parser_indicies=
end
self._http_1_1_response_parser_indicies = [
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 7, 6, 1, 8, 
	1, 9, 8, 1, 10, 1, 11, 12, 
	1, 13, 15, 14, 16, 1, 17, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	1, 19, 1, 20, 21, 20, 20, 20, 
	20, 20, 20, 20, 20, 1, 23, 24, 
	22, 26, 25, 1, 0
]

class << self
	attr_accessor :_http_1_1_response_parser_trans_targs
	private :_http_1_1_response_parser_trans_targs, :_http_1_1_response_parser_trans_targs=
end
self._http_1_1_response_parser_trans_targs = [
	2, 0, 3, 4, 5, 6, 7, 8, 
	9, 10, 11, 12, 11, 13, 13, 14, 
	15, 16, 17, 20, 17, 18, 19, 14, 
	18, 19, 14
]

class << self
	attr_accessor :_http_1_1_response_parser_trans_actions
	private :_http_1_1_response_parser_trans_actions, :_http_1_1_response_parser_trans_actions=
end
self._http_1_1_response_parser_trans_actions = [
	1, 0, 0, 0, 0, 0, 0, 0, 
	0, 3, 1, 5, 0, 1, 0, 7, 
	0, 0, 9, 17, 0, 11, 13, 19, 
	13, 0, 15
]

class << self
	attr_accessor :http_1_1_response_parser_start
end
self.http_1_1_response_parser_start = 1;
class << self
	attr_accessor :http_1_1_response_parser_first_final
end
self.http_1_1_response_parser_first_final = 20;
class << self
	attr_accessor :http_1_1_response_parser_error
end
self.http_1_1_response_parser_error = 0;

class << self
	attr_accessor :http_1_1_response_parser_en_main
end
self.http_1_1_response_parser_en_main = 1;


# line 45 "lib/net/http/http_1_1_response_parser.rl"
      
      def self.http_1_1_response_parser_parse(parser, data)
        if parser.cs.nil?
          
# line 140 "lib/net/http/http_1_1_response_parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = http_1_1_response_parser_start
end

# line 49 "lib/net/http/http_1_1_response_parser.rl"
        else
          cs = parser.cs
        end
        
        p   = parser.p
        pe  = data.length
        eof = parser.eof
        
        
# line 157 "lib/net/http/http_1_1_response_parser.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _http_1_1_response_parser_key_offsets[cs]
	_trans = _http_1_1_response_parser_index_offsets[cs]
	_klen = _http_1_1_response_parser_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _http_1_1_response_parser_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _http_1_1_response_parser_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _http_1_1_response_parser_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _http_1_1_response_parser_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _http_1_1_response_parser_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _http_1_1_response_parser_indicies[_trans]
	cs = _http_1_1_response_parser_trans_targs[_trans]
	if _http_1_1_response_parser_trans_actions[_trans] != 0
		_acts = _http_1_1_response_parser_trans_actions[_trans]
		_nacts = _http_1_1_response_parser_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _http_1_1_response_parser_actions[_acts - 1]
when 0 then
# line 8 "lib/net/http/http_1_1_response_parser.rl"
		begin
 mark = p 		end
when 1 then
# line 9 "lib/net/http/http_1_1_response_parser.rl"
		begin
 parser.handle_version(data, mark, p) 		end
when 2 then
# line 10 "lib/net/http/http_1_1_response_parser.rl"
		begin
 parser.handle_status_code(data, mark, p) 		end
when 3 then
# line 11 "lib/net/http/http_1_1_response_parser.rl"
		begin
 parser.handle_reason_phrase(data, mark, p) 		end
when 4 then
# line 13 "lib/net/http/http_1_1_response_parser.rl"
		begin
 start_field_name = p 		end
when 5 then
# line 14 "lib/net/http/http_1_1_response_parser.rl"
		begin
 parser.handle_field_name(data, start_field_name, p) 		end
when 6 then
# line 15 "lib/net/http/http_1_1_response_parser.rl"
		begin
 start_field_value = p 		end
when 7 then
# line 16 "lib/net/http/http_1_1_response_parser.rl"
		begin
 parser.handle_field_value(data, start_field_value, p) 		end
when 8 then
# line 21 "lib/net/http/http_1_1_response_parser.rl"
		begin
 parser.done!(data, p) 		end
# line 274 "lib/net/http/http_1_1_response_parser.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 58 "lib/net/http/http_1_1_response_parser.rl"
        
        parser.cs = cs
        parser.p  = p
      end
      
      attr_accessor :p, :cs, :eof, :data, :mark
      attr_accessor :response
      attr_accessor :done
      
      def initialize(response)
        @p        = 0
        @cs       = nil
        @eof      = -1
        @data     = []
        
        @done     = false
        @response = response
      end
      
      def parse(input)
        if @done
          handle_body(input)
        else
          @data.concat(input.kind_of?(String) ? input.unpack('C*') : input)
          self.class.http_1_1_response_parser_parse(self, @data)
        end
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
      
      def handle_body(input)
        response.body ||= ''
        response.body << input
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
