class Interface
  def puts_welcome(player)
    puts "#{player} - добро пожаловать в игру BlackJack!\n"
  end

  def puts_username
    print 'Введите Ваше имя: '
    gets_input
  end

  def gets_input
    gets.chomp.to_s
  end
end
