class Interface
  def puts_welcome(player)
    puts "#{player} - добро пожаловать в игру BlackJack!\n"
  end

  def puts_username
    print 'Введите Ваше имя: '
    gets_input.to_s
  end

  def puts_menu(user_cards, user_cards_sum, computer_cards, add_card)
    puts "\nВаши карты: #{user_cards}, сумма очков #{user_cards_sum}"
    puts "Карты компьютера: #{computer_cards}"
    puts 'Цифра 1 - открыть карты'
    puts 'Цифра 2 - пропустить ход'
    puts 'Цифра 3 - добавить карту' if add_card
    gets_input.to_i
  end

  def gets_input
    gets.chomp
  end
end
