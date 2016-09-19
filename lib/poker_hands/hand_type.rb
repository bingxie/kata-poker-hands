# frozen_string_literal: true

class HandType
  include Comparable

  attr_reader :name, :score

  def initialize(cards)
    @cards = cards
    check_straight_flush || check_high_card
  end

  def <=>(other)
    @score <=> other.score
  end

  def check_straight_flush
    if straight? && flush?
      @score = 10
      @name = 'STRAIGHT_FLUSH'
    end
  end

  # def check_four_of_a_kind
  # end

  # def check_full_house
  # end

  # def check_flush
  # end

  # def check_straight
  # end

  def check_high_card
    @score = 0
    @name = 'HIGH_CARD'
  end

  def straight?
    values_str = Card::VALUES.join
    cards_value_str = @cards.map(&:value).join
    values_str.include? cards_value_str
  end

  def flush?
    @cards.all? { |card| card.suit == @cards[0].suit }
  end
end
