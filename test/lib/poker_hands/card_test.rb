require_relative '../../test_helper'

class CardTest < Minitest::Test
  def test_compare
    card_1 = Card.new('2', 'C')
    card_2 = Card.new('3', 'D')

    assert card_1 < card_2

    card_3 = Card.new('3', 'H')
    assert card_2 == card_3

    card_4 = Card.new('A', 'D')
    card_5 = Card.new('A', 'H')
    assert card_4 == card_5
  end

  def test_parse_cards
    input = '2H 3D 5S 9C KD'
    cards = Card.parse_cards(input)
    assert_equal 5, cards.length

    assert_equal 'H', cards[0].suit
    assert_equal 'K', cards[4].value
  end

  def test_is_straight?
    cards = Card.parse_cards('2D 3D 4C 5D 6D')
    assert Card.is_straight?(cards)

    cards = Card.parse_cards('2D 3D 3C 5D 6D')
    refute Card.is_straight?(cards)
  end
end
