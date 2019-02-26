require_relative 'cards.rb'
require_relative 'interface.rb'
require_relative 'player.rb'
require_relative 'bank.rb'
require_relative 'computer.rb'
require_relative 'desk.rb'

class Main
  attr_reader :desk

	def initialize
    @ui = Interface.new
    @player = Player.new(@ui.puts_username)
    @computer = Computer.new('Computer')
    @player.bank = Bank.new(@player)
    @computer.bank = Bank.new(@computer)
    @ui.puts_welcome(@player.name)
  end

  def start_new_game
    loop do
      @desk = Deck.new
      if @player.cards
        @player.return_cards
        @computer.return_cards
      end
      @player.take_card(@desk.get_start_cards)
      @computer.take_card(@desk.get_start_cards)
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
    @ui.bet_message(@player.bank.amount, @computer.bank.amount)
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
        @player.take_card(@desk.get_card)
        computer_move
      else
        exit
      end
    end
  end

  def open_cards

  end

  def computer_move
    @computer.take_card(@desk.get_card) if @computer.take_card?
    next_move?
  end

  def next_move?
    check_cards_count ? open_cards : user_move
  end

  def check_cards_count
    @computer.cards.size == && @player.cards.size == 3
  end

end

Main.new
