# frozen_string_literal: true

class HandType
  include Comparable

  attr_reader :name, :score

  def initialize(cards)
    @cards = cards
    check_straight_flush
  end

  def <=>(other)
    @score <=> other.score
  end

  # def <=>(other)
  #   self.score <=> other.score
  # end

  def check_straight_flush
    straight? && flush?
    @name = 'STRAIGHT_FLUSH'
    @score = 10
    @name.nil?
  end

  # def check_four_of_a_kind
  # end

  # def check_full_house
  # end

  # def check_flush
  # end

  # def check_straight
  # end

  def straight?
    values_str = Card::VALUES.join
    cards_value_str = @cards.map(&:value).join
    values_str.include? cards_value_str
  end

  def flush?
    @cards.all? { |card| card.suit == @cards[0].suit }
  end
end
