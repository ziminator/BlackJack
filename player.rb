class Player
  attr_reader :name
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
  end
end
