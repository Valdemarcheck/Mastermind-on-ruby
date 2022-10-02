require_relative('./board')

class Player
  attr_accessor :pattern

  def initialize
    @pattern = []
  end
end
