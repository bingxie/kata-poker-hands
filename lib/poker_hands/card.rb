class Card
  include Comparable

  attr_reader :suit, :value

  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'].freeze

  def initialize(value, suit)
    @suit = suit
    @value = value
  end

  def <=>(other)
    VALUES.index(self.value) <=> VALUES.index(other.value)
  end

  def to_s
    @value + @suit
  end

  def self.parse_cards(cards_str)
    cards = cards_str.split(' ')
    cards.map do |c|
      Card.new(c[0], c[1])
    end
  end

  def self.is_straight?(cards)
    values_str = VALUES.join
    cards_value_str = (cards.map &:value).join
    values_str.include? cards_value_str
  end

  # Todo use struct
end
