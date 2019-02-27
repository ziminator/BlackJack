class Cards
  attr_reader :suit, :value

  SUIT = %w[♣ ♥ ♦ ♠].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'В', 'Д', 'К', 'Т'].freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
    validate_cards
  end

  def validate_cards
    raise 'Ошибка! Отсутствуют масти' unless SUIT.include?(@suit)
    raise 'Ошибка! Карты отсутствуют' unless VALUES.include?(@value)
  end
end
