require_relative('./board.rb')

class Player
    attr_accessor :pattern

    def initialize
        @pattern = Array.new
    end
end