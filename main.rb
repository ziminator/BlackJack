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

end

Main.new
