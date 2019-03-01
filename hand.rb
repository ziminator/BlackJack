class Hand
  def card_sum(cards)
    values = assign_values(cards)
    values.each do |value|
      if values.sum < 21 && value == 1
        values[values.index(value)] = 11 if values.sum + 10 < 22
      end
    end
    values.sum
  end

  def assign_values(cards)
    values = []
    cards.each do |card|
      values << if pictures.include?(card.value)
        10
      elsif card.value == 'Т'
        1
      else
        card.value
      end
    end
    values
  end

  def player_cards(cards)
    (cards.map { |card| "#{card.value}#{card.suit}" }).join(' ')
  end

  def pictures
    %w[В Д К]
  end
end
