# frozen_string_literal: true
require_relative './hand_type'
require_relative './card'

class PokerHand
  attr_reader :hand_type, :cards

  def initialize(cards_str)
    @cards = Card.parse_cards(cards_str).sort
    @hand_type = HandType.new(@cards)
  end

  def compare(other)
    return "Black wins. - with #{@hand_type.name}" if @hand_type > other.hand_type

    return "White wins. - with #{other.hand_type.name}" if @hand_type < other.hand_type

    if @hand_type == other.hand_type
      case @hand_type.name
      when 'STRAIGHT_FLUSH'
        compare_highest_card(other.highest_card)
      when 'HIGH_CARD'
        compare_high_card(other.cards)
      end
    end
  end

  def highest_card
    @cards.last
  end

  private

  def compare_highest_card(other_highest_card)
    return "Black wins. - with high card: #{highest_card}" if highest_card > other_highest_card
    return "White wins. - with high card: #{other_highest_card}" if highest_card < other_highest_card
    'Tie.'
  end

  def compare_high_card(other_cards)
    4.downto(0) do |i|
      if @cards[i] > other_cards[i]
        return "Black wins. - with high card: #{@cards[i]}"
      elsif @cards[i] < other_cards[i]
        return "White wins. - with high card: #{other_cards[i]}"
      end
    end
    'Tie.'
  end
end
