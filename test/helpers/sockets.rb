class FakeSocket
  class << self
    attr_accessor :chunks
  end
  
  def read
    @chunk_position ||= 0
    current_chunk = self.class.chunks[@chunk_position]
    @chunk_position += 1
    @chunk_position = 0 if @chunk_position >= self.class.chunks.length
    current_chunk
  end
  
  def write(*)
  end
end

module Net
  class HTTP
    class Request
      def socket
        @socket ||= FakeSocket.new
      end
    end
  end
end