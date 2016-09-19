# frozen_string_literal: true
require_relative '../test_helper'

class PokerHandsTest < Minitest::Test
  def test_play
    black = '2H 3D 5S 9C AD'
    white = '2C 3H 4S 8C AH'
    PokerHands.play(black, white)
  end
end
