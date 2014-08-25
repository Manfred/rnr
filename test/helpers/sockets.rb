class FakeSocket
  class << self
    attr_accessor :chunks
  end
  
  def read(maxlength=1024)
    @chunk_position ||= 0
    current_chunk = self.class.chunks[@chunk_position]
    @chunk_position += 1
    if @chunk_position > self.class.chunks.length
      nil
    else
      current_chunk
    end
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