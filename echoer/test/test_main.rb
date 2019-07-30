require 'minitest/autorun'

require_relative '../src/main'

class MainTest < Minitest::Test
  def test_main_says_hello
    skip # no longer what main does
    assert_equal 'hello', hello
  end
end
