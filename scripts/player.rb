require_relative('./board.rb')

class Player
    attr_accessor :pattern

    def initialize(pattern)
        @pattern = pattern
    end
end