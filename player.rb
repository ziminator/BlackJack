require_relative 'deck.rb'
require_relative 'cards.rb'
require_relative 'hand.rb'

class Player
  attr_reader :name
  attr_accessor :bank, :cards

  def initialize(name)
    @hand = Hand.new
    @name = name
    @bank = 0
  end

  def take_card(cards)
    if @cards
      self.cards += cards
    else
      self.cards = cards
    end
  end

  def card_sum
    @hand.card_sum(cards)
  end

  def player_cards
    @hand.player_cards(cards)
  end

  def return_cards
    self.cards = nil
  end

  def two_cards?
    self.cards.size == 2
  end
end
