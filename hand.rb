class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(cards)
    if @cards
      @cards += cards
    else
      @cards = cards
    end
  end

  def card_sum
    values = assign_values
    values.each do |value|
      if values.sum < 21 && value == 1
        values[values.index(value)] = 11 if values.sum + 10 < 22
      end
    end
    values.sum
  end

  def assign_values
    values = []
    @cards.each do |card|
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

  def player_cards
    (@cards.map { |card| "#{card.value}#{card.suit}" }).join(' ')
  end

  def pictures
    %w[В Д К]
  end

  def return_cards
    @cards = nil
  end

  def two_cards
    @cards.size == 2
  end
end
