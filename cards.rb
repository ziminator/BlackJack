class Cards
  attr_reader :suit, :cards

  SUIT = %w[♣ ♥ ♦ ♠].freeze
  CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'В', 'Д', 'К', 'Т'].freeze

  def initialize(cards, suit)
    @cards = cards
    @suit = suit
    validate_cards
  end

  def validate_cards
    raise 'Ошибка! Карты отсутствуют' unless CARDS.include?(@cards)
    raise 'Ошибка! Отсутствуют масти' unless SUIT.include?(@suit)
  end
end
