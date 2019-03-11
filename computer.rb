require_relative 'player.rb'
require_relative 'hand.rb'

class Computer < Player
  def take_card?
    @hand.card_sum < 17 && @hand.cards.size == 2
  end

  def hide_cards
    @hand.cards.map { '*' }.join(' ')
  end
end
