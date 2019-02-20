require_relative 'card.rb'

class Desk
  attr_reader :deck

  def initialize
    @desk = make_desk
  end

  def make_desk
    desk = []
    Card::SUIT.each do |suite|
      Crad::CARDS.each do |cards|
        desk << Card.new(cards, suite)
      end
    end
    desk.shuffle
  end

  def get_card(number = 1)
    @desk.shift(number)
  end

  def get_start_cards
    get_card(2)
  end
end
