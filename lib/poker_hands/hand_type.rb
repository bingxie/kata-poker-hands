class HandType
  include Comparable

  def initialize(cards)
    @cards = cards

    # @name = 'STRAIGHT_FLUSH'
    # @score = 10
  end

  # def <=>(other)
  #   self.score <=> other.score
  # end

  # def check_straight_flush
  # end

  # def check_four_of_a_kind
  # end

  # def check_full_house
  # end

  # def check_flush
  # end

  # def check_straight
  # end

  def is_straight?
    values_str = Card::VALUES.join
    cards_value_str = (@cards.map &:value).join
    values_str.include? cards_value_str
  end

  # def self.is_flush?(cards)
  # end
end
