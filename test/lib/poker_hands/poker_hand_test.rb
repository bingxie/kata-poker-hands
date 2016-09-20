# frozen_string_literal: true
require_relative '../../test_helper'

class PokerHandTest < Minitest::Test
  def test_straight_flush
    result = compare_hands('3D 4D 5D 6D 7D', '2D 3D 4D 5D 6D')
    assert_equal 'Black wins. - with high card: 7D', result
  end

  def test_straight_flush_tie
    result = compare_hands('2C 3C 4C 5C 6C', '2D 3D 4D 5D 6D')
    assert_equal 'Tie.', result
  end

  def test_high_card
    result = compare_hands('2H 3D 5S 9C AD', '2C 3H 4S 8C AH')
    assert_equal 'Black wins. - with high card: 9C', result
  end

  def test_high_card_tie
    result = compare_hands('2H 3D 4H 8D AD', '2C 3H 4S 8C AH')
    assert_equal 'Tie.', result
  end

  private

  def compare_hands(black, white)
    hand_black = PokerHand.new(black)
    hand_white = PokerHand.new(white)
    hand_black.compare(hand_white)
  end
end
