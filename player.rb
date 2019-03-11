require_relative 'deck.rb'
require_relative 'cards.rb'
require_relative 'hand.rb'

class Player
  attr_reader :name, :hand
  attr_accessor :bank

  def initialize(name)
    @bank = Bank.new(self)
    @hand = Hand.new
    @name = name
  end

  def take_card(cards)
    @hand.add_card(cards)
  end

  def card_sum
    @hand.card_sum
  end

  def player_cards
    @hand.player_cards
  end

  def return_cards
    @hand.return_cards
  end

  def two_cards?
    @hand.two_cards
  end
end
