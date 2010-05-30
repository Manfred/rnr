
# line 1 "lib/net/http/http_1_1_parser.rl"
module Net
  class HTTP
    class HTTP_1_1_Parser
      
      
# line 44 "lib/net/http/http_1_1_parser.rl"

      
      
# line 13 "lib/net/http/http_1_1_parser.rb"
class << self
	attr_accessor :_http_1_1_parser_actions
	private :_http_1_1_parser_actions, :_http_1_1_parser_actions=
end
self._http_1_1_parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 9, 1, 10, 2, 6, 7, 
	2, 8, 9, 2, 8, 10
]

class << self
	attr_accessor :_http_1_1_parser_key_offsets
	private :_http_1_1_parser_key_offsets, :_http_1_1_parser_key_offsets=
end
self._http_1_1_parser_key_offsets = [
	0, 0, 1, 2, 3, 4, 5, 7, 
	10, 12, 15, 17, 20, 20, 21, 22, 
	38, 39, 55, 57, 58, 58
]

class << self
	attr_accessor :_http_1_1_parser_trans_keys
	private :_http_1_1_parser_trans_keys, :_http_1_1_parser_trans_keys=
end
self._http_1_1_parser_trans_keys = [
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
	attr_accessor :_http_1_1_parser_single_lengths
	private :_http_1_1_parser_single_lengths, :_http_1_1_parser_single_lengths=
end
self._http_1_1_parser_single_lengths = [
	0, 1, 1, 1, 1, 1, 0, 1, 
	0, 1, 0, 1, 0, 1, 1, 4, 
	1, 4, 2, 1, 0, 0
]

class << self
	attr_accessor :_http_1_1_parser_range_lengths
	private :_http_1_1_parser_range_lengths, :_http_1_1_parser_range_lengths=
end
self._http_1_1_parser_range_lengths = [
	0, 0, 0, 0, 0, 0, 1, 1, 
	1, 1, 1, 1, 0, 0, 0, 6, 
	0, 6, 0, 0, 0, 0
]

class << self
	attr_accessor :_http_1_1_parser_index_offsets
	private :_http_1_1_parser_index_offsets, :_http_1_1_parser_index_offsets=
end
self._http_1_1_parser_index_offsets = [
	0, 0, 2, 4, 6, 8, 10, 12, 
	15, 17, 20, 22, 25, 26, 28, 30, 
	41, 43, 54, 57, 59, 60
]

class << self
	attr_accessor :_http_1_1_parser_indicies
	private :_http_1_1_parser_indicies, :_http_1_1_parser_indicies=
end
self._http_1_1_parser_indicies = [
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 7, 6, 1, 8, 
	1, 9, 8, 1, 10, 1, 11, 12, 
	1, 13, 15, 14, 16, 1, 17, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	1, 19, 1, 20, 21, 20, 20, 20, 
	20, 20, 20, 20, 20, 1, 23, 24, 
	22, 26, 25, 27, 28, 0
]

class << self
	attr_accessor :_http_1_1_parser_trans_targs
	private :_http_1_1_parser_trans_targs, :_http_1_1_parser_trans_targs=
end
self._http_1_1_parser_trans_targs = [
	2, 0, 3, 4, 5, 6, 7, 8, 
	9, 10, 11, 12, 11, 13, 13, 14, 
	15, 16, 17, 20, 17, 18, 19, 14, 
	18, 19, 14, 21, 21
]

class << self
	attr_accessor :_http_1_1_parser_trans_actions
	private :_http_1_1_parser_trans_actions, :_http_1_1_parser_trans_actions=
end
self._http_1_1_parser_trans_actions = [
	1, 0, 0, 0, 0, 0, 0, 0, 
	0, 3, 1, 5, 0, 1, 0, 7, 
	0, 0, 9, 0, 0, 11, 13, 21, 
	13, 0, 15, 27, 19
]

class << self
	attr_accessor :_http_1_1_parser_eof_actions
	private :_http_1_1_parser_eof_actions, :_http_1_1_parser_eof_actions=
end
self._http_1_1_parser_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 24, 17
]

class << self
	attr_accessor :http_1_1_parser_start
end
self.http_1_1_parser_start = 1;
class << self
	attr_accessor :http_1_1_parser_first_final
end
self.http_1_1_parser_first_final = 20;
class << self
	attr_accessor :http_1_1_parser_error
end
self.http_1_1_parser_error = 0;

class << self
	attr_accessor :http_1_1_parser_en_main
end
self.http_1_1_parser_en_main = 1;


# line 47 "lib/net/http/http_1_1_parser.rl"
      
      def self.http_1_1_parser_parse(parser, data)
        eof  = data.length
        data = data.unpack("c*") if data.is_a?(String)
        
# line 152 "lib/net/http/http_1_1_parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = http_1_1_parser_start
end

# line 52 "lib/net/http/http_1_1_parser.rl"
        
# line 161 "lib/net/http/http_1_1_parser.rb"
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
	_keys = _http_1_1_parser_key_offsets[cs]
	_trans = _http_1_1_parser_index_offsets[cs]
	_klen = _http_1_1_parser_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _http_1_1_parser_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _http_1_1_parser_trans_keys[_mid]
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
	  _klen = _http_1_1_parser_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _http_1_1_parser_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _http_1_1_parser_trans_keys[_mid+1]
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
	_trans = _http_1_1_parser_indicies[_trans]
	cs = _http_1_1_parser_trans_targs[_trans]
	if _http_1_1_parser_trans_actions[_trans] != 0
		_acts = _http_1_1_parser_trans_actions[_trans]
		_nacts = _http_1_1_parser_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _http_1_1_parser_actions[_acts - 1]
when 0 then
# line 8 "lib/net/http/http_1_1_parser.rl"
		begin
 mark = p 		end
# line 8 "lib/net/http/http_1_1_parser.rl"
when 1 then
# line 9 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.handle_version(data, mark, p) 		end
# line 9 "lib/net/http/http_1_1_parser.rl"
when 2 then
# line 10 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.handle_status_code(data, mark, p) 		end
# line 10 "lib/net/http/http_1_1_parser.rl"
when 3 then
# line 11 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.handle_reason_phrase(data, mark, p) 		end
# line 11 "lib/net/http/http_1_1_parser.rl"
when 4 then
# line 13 "lib/net/http/http_1_1_parser.rl"
		begin
 start_field_name = p 		end
# line 13 "lib/net/http/http_1_1_parser.rl"
when 5 then
# line 14 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.handle_field_name(data, start_field_name, p) 		end
# line 14 "lib/net/http/http_1_1_parser.rl"
when 6 then
# line 15 "lib/net/http/http_1_1_parser.rl"
		begin
 start_field_value = p 		end
# line 15 "lib/net/http/http_1_1_parser.rl"
when 7 then
# line 16 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.handle_field_value(data, start_field_value, p) 		end
# line 16 "lib/net/http/http_1_1_parser.rl"
when 8 then
# line 18 "lib/net/http/http_1_1_parser.rl"
		begin
 mark = p 		end
# line 18 "lib/net/http/http_1_1_parser.rl"
when 10 then
# line 21 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.done! 		end
# line 21 "lib/net/http/http_1_1_parser.rl"
# line 292 "lib/net/http/http_1_1_parser.rb"
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
	if p == eof
	__acts = _http_1_1_parser_eof_actions[cs]
	__nacts =  _http_1_1_parser_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _http_1_1_parser_actions[__acts - 1]
when 8 then
# line 18 "lib/net/http/http_1_1_parser.rl"
		begin
 mark = p 		end
# line 18 "lib/net/http/http_1_1_parser.rl"
when 9 then
# line 19 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.handle_body(data, mark, p) 		end
# line 19 "lib/net/http/http_1_1_parser.rl"
# line 330 "lib/net/http/http_1_1_parser.rb"
		end # eof action switch
	end
	if _trigger_goto
		next
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 53 "lib/net/http/http_1_1_parser.rl"
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
      
      def handle_body(data, mark, pointer)
        response.body = self.class.join(data, mark, pointer)
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
