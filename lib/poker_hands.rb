# frozen_string_literal: true
require_relative './poker_hands/card'
require_relative './poker_hands/poker_hand'

class PokerHands
  def self.play(black, white)
    black_cards = Card.parse_cards(black)
    white_cards = Card.parse_cards(white)

    poker_hand_black = PokerHand.new(black_cards)
    poker_hand_white = PokerHand.new(white_cards)

    poker_hand_black.compare(poker_hand_white)
  end

  def self.high_card(black_cards, white_cards)
    4.downto(0) do |i|
      if black_cards[i] > white_cards[i]
        return "Black wins. - with high card: #{black_cards[i]}"
      elsif black_cards[i] < white_cards[i]
        return "White wins. - with high card: #{white_cards[i]}"
      end
    end
    'Tie.'
  end
end

puts PokerHands.play('3D 4C 5D 6D 7D', '4D 5D 6D 7D 8D')
