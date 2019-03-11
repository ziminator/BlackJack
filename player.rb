require_relative 'deck.rb'
require_relative 'cards.rb'
require_relative 'hand.rb'

class Player
  attr_reader :name, :hand
  attr_accessor :bank, :cards

  def initialize(name)
    @bank = Bank.new(self)
    @hand = Hand.new
    @name = name
  end

  def take_card(cards)
    if @cards
      self.cards += cards
    else
      self.cards = cards
    end
  end

  #def take_card(cards)
  #  @hand.add_card(cards)
  #end

  def card_sum
    @hand.card_sum(cards)
  end

  def player_cards
    @hand.player_cards(cards)
  end



  def two_cards?
    self.cards.size == 2
  end
end
