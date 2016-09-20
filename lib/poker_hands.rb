# frozen_string_literal: true
require_relative './poker_hands/poker_hand'

class PokerHands
  def self.play(black, white)
    poker_hand_black = PokerHand.new(black)
    poker_hand_white = PokerHand.new(white)

    poker_hand_black.compare(poker_hand_white)
  end
end
