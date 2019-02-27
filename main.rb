require_relative 'interface.rb'
require_relative 'player.rb'
require_relative 'bank.rb'
require_relative 'computer.rb'
require_relative 'deck.rb'

class Main
  attr_reader :deck

	def initialize
    @ui = Interface.new
    @player = Player.new(@ui.puts_username)
    @computer = Computer.new('Computer')
    @player.bank = Bank.new(@player)
    @computer.bank = Bank.new(@computer)
    @ui.puts_welcome(@player.name)
    start_new_game
  end

  def start_new_game
    loop do
      @deck = Deck.new
      if @player.cards
        @player.return_cards
        @computer.return_cards
      end
      @player.take_card(@deck.get_start_cards)
      @computer.take_card(@deck.get_start_cards)
      return unless start_game
    end
  end

  def start_game
    start_bet
    user_move
    try_again?
  end

  def start_bet
    @player.bank.place_bet
    @computer.bank.place_bet
    @ui.puts_bet_message(@player.bank.amount, @computer.bank.amount)
  end

  def user_move
    answer = @ui.puts_menu(@player.player_cards, @player.card_sum, @computer.hide_cards, @player.two_cards?)
    case answer
    when 1
      open_cards
    when 2
      computer_move
    when 3
      if @player.two_cards?
        @player.take_card(@deck.get_card)
        computer_move
      else
        exit
      end
    end
  end

  def open_cards
    @ui.puts_show_cards(@player.player_cards, @player.card_sum, @computer.player_cards, @computer.card_sum)
    @ui.puts_show_results(winner, @player.name, @computer.name)
    case winner
    when :draw
      return_money(@player, @computer)
    when :player
      @player.bank.money_to_winner
    when :computer
      @computer.bank.money_to_winner
    end
    check_bank
  end

  def winner
    player_card_sum = @player.card_sum
    computer_card_sum = @computer.card_sum
    if player_card_sum > 21 && computer_card_sum > 21
      return :nobody
    elsif player_card_sum == computer_card_sum
      return :draw
    elsif player_card_sum < 22 && computer_card_sum > 21
      return :player
    elsif computer_card_sum < 22 && player_card_sum > 21
      return :computer
    elsif computer_card_sum > player_card_sum
      return :computer
    elsif computer_card_sum < player_card_sum
      return :player
    end
  end

  def computer_move
    @computer.take_card(@deck.get_card) if @computer.take_card?
    next_move?
  end

  def next_move?
    check_cards_count ? open_cards : user_move
  end

  def check_cards_count
    @computer.cards.size == 3 && @player.cards.size == 3
  end

  def return_money(*players)
    players.each { |player| player.bank.return_money}
  end

  def try_again?
    answer = @ui.puts_try_again
    answer == 1
  end

  def check_bank
    if @player.bank.amount < 10
      @ui.computer_win(@player.bank.amount)
      exit
    elsif @computer.bank.amount < 10
      @ui.player_win(@computer.bank.amount)
      exit
    end
  end

end

Main.new
