require_relative '../../test_helper'

class HandTypeTest < Minitest::Test
  def test_is_straight?
    cards = Card.parse_cards('2D 3D 4C 5D 6D')
    type = HandType.new(cards)

    assert type.is_straight?
  end

  def test_is_not_straight?
    cards = Card.parse_cards('2D 3D 3C 5D 6D')
    type = HandType.new(cards)

    refute type.is_straight?
  end

  def test_is_flush?
    cards = Card.parse_cards('2D 3D 3D 5D 6D')
    type = HandType.new(cards)

    assert type.is_flush?
  end

  def test_is_not_flush?
    cards = Card.parse_cards('2D 3D 3C 5D 6D')
    type = HandType.new(cards)

    refute type.is_flush?
  end
end
