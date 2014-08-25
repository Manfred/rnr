module Helpers
  module Syntax
    def test(description, &block)
      define_method("test_: #{description}", &block)
    end
  end
end