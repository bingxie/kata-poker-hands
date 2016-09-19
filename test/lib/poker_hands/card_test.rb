require_relative '../../test_helper'

class CardTest < Minitest::Test
  def test_compare
    card_1 = Card.new('2', 'C')
    card_2 = Card.new('3', 'D')

    assert card_1 < card_2

    card_3 = Card.new('3', 'H')
    assert card_2 == card_3

    card_4 = Card.new('K', 'C')
    card_5 = Card.new('A', 'D')
  end
end
