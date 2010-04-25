
# line 1 "lib/net/http/http_1_1_parser.rl"
module Net
  class HTTP
    class HTTP_1_1_Parser
      
# line 22 "lib/net/http/http_1_1_parser.rl"

      
      
# line 12 "lib/net/http/http_1_1_parser.rb"
class << self
	attr_accessor :_http_1_1_parser_actions
	private :_http_1_1_parser_actions, :_http_1_1_parser_actions=
end
self._http_1_1_parser_actions = [
	0, 1, 0, 1, 1
]

class << self
	attr_accessor :_http_1_1_parser_key_offsets
	private :_http_1_1_parser_key_offsets, :_http_1_1_parser_key_offsets=
end
self._http_1_1_parser_key_offsets = [
	0, 0, 1, 2, 3, 4, 5, 7, 
	10, 12
]

class << self
	attr_accessor :_http_1_1_parser_trans_keys
	private :_http_1_1_parser_trans_keys, :_http_1_1_parser_trans_keys=
end
self._http_1_1_parser_trans_keys = [
	72, 84, 84, 80, 47, 48, 57, 46, 
	48, 57, 48, 57, 48, 57, 0
]

class << self
	attr_accessor :_http_1_1_parser_single_lengths
	private :_http_1_1_parser_single_lengths, :_http_1_1_parser_single_lengths=
end
self._http_1_1_parser_single_lengths = [
	0, 1, 1, 1, 1, 1, 0, 1, 
	0, 0
]

class << self
	attr_accessor :_http_1_1_parser_range_lengths
	private :_http_1_1_parser_range_lengths, :_http_1_1_parser_range_lengths=
end
self._http_1_1_parser_range_lengths = [
	0, 0, 0, 0, 0, 0, 1, 1, 
	1, 1
]

class << self
	attr_accessor :_http_1_1_parser_index_offsets
	private :_http_1_1_parser_index_offsets, :_http_1_1_parser_index_offsets=
end
self._http_1_1_parser_index_offsets = [
	0, 0, 2, 4, 6, 8, 10, 12, 
	15, 17
]

class << self
	attr_accessor :_http_1_1_parser_indicies
	private :_http_1_1_parser_indicies, :_http_1_1_parser_indicies=
end
self._http_1_1_parser_indicies = [
	0, 1, 2, 1, 3, 1, 4, 1, 
	5, 1, 6, 1, 7, 6, 1, 8, 
	1, 8, 1, 0
]

class << self
	attr_accessor :_http_1_1_parser_trans_targs
	private :_http_1_1_parser_trans_targs, :_http_1_1_parser_trans_targs=
end
self._http_1_1_parser_trans_targs = [
	2, 0, 3, 4, 5, 6, 7, 8, 
	9
]

class << self
	attr_accessor :_http_1_1_parser_trans_actions
	private :_http_1_1_parser_trans_actions, :_http_1_1_parser_trans_actions=
end
self._http_1_1_parser_trans_actions = [
	1, 0, 0, 0, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :_http_1_1_parser_eof_actions
	private :_http_1_1_parser_eof_actions, :_http_1_1_parser_eof_actions=
end
self._http_1_1_parser_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 3
]

class << self
	attr_accessor :http_1_1_parser_start
end
self.http_1_1_parser_start = 1;
class << self
	attr_accessor :http_1_1_parser_first_final
end
self.http_1_1_parser_first_final = 9;
class << self
	attr_accessor :http_1_1_parser_error
end
self.http_1_1_parser_error = 0;

class << self
	attr_accessor :http_1_1_parser_en_main
end
self.http_1_1_parser_en_main = 1;


# line 25 "lib/net/http/http_1_1_parser.rl"
      
      def self.http_1_1_parser_parse(parser, data)
        eof  = data.length
        data = data.unpack("c*") if data.is_a?(String)
        
# line 128 "lib/net/http/http_1_1_parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = http_1_1_parser_start
end

# line 30 "lib/net/http/http_1_1_parser.rl"
        
# line 137 "lib/net/http/http_1_1_parser.rb"
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
# line 7 "lib/net/http/http_1_1_parser.rl"
		begin
 @mark = p 		end
# line 7 "lib/net/http/http_1_1_parser.rl"
# line 223 "lib/net/http/http_1_1_parser.rb"
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
when 1 then
# line 8 "lib/net/http/http_1_1_parser.rl"
		begin
 parser.handle_version(data[@mark..cs].pack('C*')) 		end
# line 8 "lib/net/http/http_1_1_parser.rl"
# line 256 "lib/net/http/http_1_1_parser.rb"
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

# line 31 "lib/net/http/http_1_1_parser.rl"
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
