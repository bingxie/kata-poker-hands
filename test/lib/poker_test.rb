require_relative '../test_helper'

class PokerHandsTest < Minitest::Test
  def setup
    @poker = PokerHands.new
    @poker.name = 'abc'
  end

  def test_name
    assert_equal 'abc', @poker.name
  end
end
