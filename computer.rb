require_relative 'player.rb'

class Computer < Player
  def card_taken?
    card_sum < 17 && cards.size == 2
  end

  def hide_cards
    cards.map { '*' }.join(' ')
  end
end
