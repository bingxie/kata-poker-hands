# frozen_string_literal: true
require_relative '../../test_helper'

class HandTypeTest < Minitest::Test
  def test_is_straight?
    cards = Card.parse_cards('2D 3D 4C 5D 6D')
    type = HandType.new(cards)

    assert type.straight?
  end

  def test_is_not_straight?
    cards = Card.parse_cards('2D 3D 3C 5D 6D')
    type = HandType.new(cards)

    refute type.straight?
  end

  def test_is_flush?
    cards = Card.parse_cards('2D 3D 3D 5D 6D')
    type = HandType.new(cards)

    assert type.flush?
  end

  def test_is_not_flush?
    cards = Card.parse_cards('2D 3D 3C 5D 6D')
    type = HandType.new(cards)

    refute type.flush?
  end

  def test_check_straight_flush
    cards = Card.parse_cards('2D 3D 4D 5D 6D')
    type = HandType.new(cards)

    assert_equal 'STRAIGHT_FLUSH', type.name
    assert_equal 10, type.score
  end

  def test_check_high_card
    cards = Card.parse_cards('2H 4S 5D 6D 9H')
    type = HandType.new(cards)

    assert_equal 'HIGH_CARD', type.name
    assert_equal 0, type.score
  end
end
