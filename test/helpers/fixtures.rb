module Helpers
  module Fixtures
    def file_fixture(*path)
      File.read File.expand_path("../../examples/#{path.join('/')}", __FILE__)
    end
    
    def response(path)
      file_fixture('responses', "#{path}.txt").gsub(/\n/, "\r\n")
    end
    
    def request(path)
      file_fixture('requests', "#{path}.txt").gsub(/\n/, "\r\n")
    end
  end
end