require_relative('./board.rb')

class Enemy
    attr_reader :pattern

    def initialize(pattern)
        @pattern = pattern
    end
end