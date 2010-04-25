require 'test/unit'

$:.unshift File.expand_path('../../lib', __FILE__)
require 'net/http'

$:.unshift File.expand_path('..', __FILE__)
require 'helpers/syntax'

class Net::HTTP::TestCase < Test::Unit::TestCase
  extend Helpers::Syntax
  def default_test
  end
end