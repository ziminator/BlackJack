class Interface
  def puts_welcome(player)
    puts "#{player} - добро пожаловать в игру BlackJack!\n"
  end

  def puts_username
    print 'Введите Ваше имя: '
    gets_input.to_s
  end

  def puts_bet_message(player_amount, computer_amount)
    puts "Сделаны ставки по 10$. На вашем счету #{player_amount}$. У компьютера: #{computer_amount}$"
  end

  def puts_menu(player_cards, player_cards_sum, computer_cards, add_card)
    puts "\nВаши карты: #{player_cards}, сумма очков #{player_cards_sum}"
    puts "Карты компьютера: #{computer_cards}"
    puts 'Цифра 1 - открыть карты'
    puts 'Цифра 2 - пропустить ход'
    puts 'Цифра 3 - добавить карту' if add_card
    gets_input.to_i
  end

  def puts_show_cards(player_cards, player_sum, computer_cards, computer_sum)
    puts "\nВаши карты: #{player_cards}, сумма очков: #{player_sum}"
    puts "Карты компьютера: #{computer_cards}, сумма очков: #{computer_sum}\n"
  end

  def puts_show_results(winner, player_name, computer_name)
    case winner
    when :nobody
      puts 'Игроки набрали больше 21 очка. Ставка в 10$ не возвращается'
    when :draw
      puts 'Ничья'
    when :player
      puts "Победил #{player_name}"
    when :computer
      puts "Победил #{computer_name}"
    end
  end

  def player_win(computer_amount)
    puts "У компьютера на счёте #{computer_amount}$. Поздравляем, вы выиграли!"
  end

  def computer_win(player_amount)
    puts "На вашем счёте #{player_amount}$. Этого недостаточно, игра окончена."
  end

  def puts_try_again
    puts "\nЦифра 1 - сыграть заново\nЦифра 2 - выход"
    gets_input.to_i
  end

  def gets_input
    gets.chomp
  end
end
