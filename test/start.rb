gem 'minitest'
require 'minitest/autorun'

$:.unshift File.expand_path('../../lib', __FILE__)
require 'net/http'

$:.unshift File.expand_path('..', __FILE__)
require 'helpers/fixtures'
require 'helpers/sockets'
require 'helpers/syntax'

class Net::HTTP::TestCase < Minitest::Test
  parallelize_me!

  include Helpers::Fixtures
  extend Helpers::Syntax
end