require_relative 'cards.rb'

class Deck
  attr_reader :deck

  def initialize
    @deck = make_deck
  end

  def make_deck
    deck = []
    Cards::SUIT.each do |suite|
      Cards::VALUES.each do |value|
        deck << Cards.new(value, suite)
      end
    end
    deck.shuffle
  end

  def get_card(number = 1)
    @deck.shift(number)
  end

  def get_start_cards
    get_card(2)
  end
end
