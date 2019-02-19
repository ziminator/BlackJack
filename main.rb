require_relative 'cards.rb'
require_relative 'interface.rb'
require_relative 'player.rb'
require_relative 'bank.rb'
require_relative 'computer.rb'

class Main

	def initialize
    @ui = Interface.new
    @player = Player.new(@ui.puts_username)
    @computer = Computer.new('Computer')
    @player.bank = Bank.new(@player)
    @computer.bank = Bank.new(@computer)
    @ui.puts_welcome(@player.name)
  end

end

Main.new
