require_relative('./board.rb')
require_relative('./enemy.rb')
require_relative('./player.rb')
require_relative('./Text.rb')
require_relative('./Events.rb')
require_relative('./GetString.rb')

class Game
    extend GetString
    extend Text
    attr_accessor :win, :duplicates_allowed

    # establishes a game session
    def self.start
        announce_beginning
        ask_for_rules
        explain_rules if get_one_char('y', 'n') == 'y'
        sleep(0.5)
        puts "Ok, now we need to adjust some settings"
        sleep(0.5)
        ask_for_duplicates
        @duplicates_allowed = duplicates?
        sleep(0.5)
        ask_for_spaces
        spaces?

        @player = Player.new
        @enemy = Enemy.new(generate_random_str(@duplicates_allowed))
        sleep(0.5)
        announce_start
        begin_game
    end

    # create a board and start the game
    def self.begin_game
        @board = Board.new(@enemy, @player, @duplicates_allowed)
    end

end
