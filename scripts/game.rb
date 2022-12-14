require_relative('./board')
require_relative('./enemy')
require_relative('./player')
require_relative('./Text')
require_relative('./Events')
require_relative('./GetString')

class Game
  extend GetString
  extend Text
  attr_accessor :win, :duplicates_allowed

  # establishes a game session
  def self.start
    announce_beginning
    sleep(1)
    ask_for_rules
    explain_rules if get_one_char('y', 'n') == 'y'
    sleep(0.5)
    puts 'Ok, now we need to adjust some settings'
    ask_for_duplicates
    @duplicates_allowed = duplicates?
    ask_for_spaces
    spaces?

    @player = Player.new
    @enemy = Enemy.new(generate_random_str(@duplicates_allowed))
    announce_start
    begin_game
  end

  # create a board and start the game
  def self.begin_game
    @board = Board.new(@enemy, @player, @duplicates_allowed)
  end
end
