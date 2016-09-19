# frozen_string_literal: true
require_relative './hand_type'

class PokerHand
  attr_reader :hand_type

  def initialize(cards)
    @cards = cards
    @hand_type = HandType.new(@cards)
  end

  def compare(other)
    return "Black wins. - with #{@hand_type.name}" if @hand_type > other.hand_type

    return "White wins. - with #{other.hand_type.name}" if @hand_type < other.hand_type

    if @hand_type = other.hand_type
      case @hand_type.name
      when 'STRAIGHT_FLUSH'
        compare_highest_card(highest_card, other.highest_card)
      end
    end
  end

  def highest_card
    @cards.last
  end

  private

  def compare_highest_card(highest_card, other_highest_card)
    return "Black wins. - with high card: #{highest_card}" if highest_card > other_highest_card
    return "White wins. - with high card: #{other_highest_card}" if highest_card < other_highest_card
    return 'Tie' if highest_card == other_highest_card
  end
end
