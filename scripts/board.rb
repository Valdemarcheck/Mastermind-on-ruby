require_relative('./game.rb')
require_relative('./enemy.rb')
require_relative('./player.rb')
require_relative('./Events.rb')
require_relative('./GetString.rb')
require_relative('./Text.rb')

class Board
    include Events
    include Text
    include GetString
    attr_accessor :game_pattern, :attempts, :board_rows, :row, :comparison_result
    attr_reader :enemy_pattern

    def initialize(enemy, player, duplicates_allowed)
        @enemy = enemy
        @player = player
        @duplicates_allowed = duplicates_allowed
        @attempts = 9
        @row = -1
        @board_rows = Array.new(11) { '' }
        @win = false
        play
    end

    private

    # infinite game loop
    def play
        fill_board_rows
        loop do
            print_board
            ask_player_pattern
            @player.pattern = get_six_char_string(@duplicates_allowed)
            @comparison_result = compare_patterns
            break unless @comparison_result == nil
            replace_board_row
        end
        announce_result(@comparison_result)
    end

    # fill the board with rows for the first time
    def fill_board_rows
        @board_rows = @board_rows.map {|row| row = '|■|------|■|'}
        @board_rows[0] = '|■|??????|■|'
    end

    # replace a certain row of the board with |+|#{player_pattern}|+|
    def replace_board_row
        @board_rows[row] = '|■|' + @player.pattern.join('') + '|■|'
        @row -= 1
        @attempts -= 1
    end

    # print a board in the console
    def print_board
        @board_rows.each {|row| puts row}
    end

    # compare player pattern with enemy's pattern
    def compare_patterns
        if @player.pattern == @enemy.pattern
            return true
        elsif @attempts == 0
            return false
        end
        nil
    end

end