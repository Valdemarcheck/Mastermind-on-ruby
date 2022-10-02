class Board
    
    attr_accessor :game_pattern, :attempts, :board_rows, :row
    attr_reader :enemy_pattern

    def initialize(enemy_pattern, game_pattern)
        @enemy_pattern = enemy_pattern
        @player_pattern = game_pattern
        @attempts = 10
        @row = -1
        @board_rows = []
    end

    private

    # infinite game loop
    def play

    end

    # fill the board with rows for the first time
    def fill_board_rows

    end

    # replace a certain row of the board with |+|#{player_pattern}|+|
    def replace_board_row

    end

    # print a board in the console
    def print_board

    end

    # compare player pattern with enemy's pattern
    def compare_patterns

    end

    # check for a win/lose situation
    def check_for_event

    end

end