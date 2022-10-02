require_relative('./board')

class Enemy
  attr_reader :pattern

  def initialize(pattern)
    @pattern = pattern
  end
end
