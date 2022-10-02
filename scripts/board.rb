require 'colorize'
require_relative('./game')
require_relative('./enemy')
require_relative('./player')
require_relative('./Events')
require_relative('./GetString')
require_relative('./Text')

class Board
  include Events
  include Text
  include GetString
  attr_accessor :game_pattern, :attempts, :board_rows, :row, :comparison_result, :matches_quantity
  attr_reader :enemy_pattern

  def initialize(enemy, player, duplicates_allowed)
    @enemy = enemy
    @player = player
    @duplicates_allowed = duplicates_allowed
    @attempts = 9
    @row = -1
    @board_rows = Array.new(11) { '' }
    @matches_quantity = 0
    play
  end

  private

  # infinite game loop
  def play
    fill_board_rows
    loop do
      print_divider
      print_board
      announce_matches(@matches_quantity)
      sleep(0.5)
      ask_player_pattern
      @player.pattern = get_six_char_string(@duplicates_allowed)
      @comparison_result = compare_patterns
      break unless @comparison_result.nil?

      @matches_quantity = matches
      replace_board_row(@matches_quantity)
    end
    announce_result(@comparison_result)
  end

  # fill the board with rows for the first time
  def fill_board_rows
    @board_rows = @board_rows.map { '|■|----|■|' }
    @board_rows[0] = '|■|????|■|'
  end

  # replace a certain row of the board with |+|#{player_pattern}|+|
  def replace_board_row(matches)
    @board_rows[row] = "|■| #{@player.pattern.join('')} |#{matches}|".yellow
    @row -= 1
    @attempts -= 1
  end

  # print a board in the console
  def print_board
    @board_rows.each do |row|
      puts row
      sleep(0.05)
    end
  end

  # compare player pattern with enemy's pattern
  def compare_patterns
    return true if @player.pattern == @enemy.pattern

    return false if @attempts.zero?

    nil
  end

  # outputs how many pegs' positions of player's pattern matched with pegs' positions of enemy's pattern
  def matches
    matches = 0
    4.times do |i|
      matches += 1 if @player.pattern[i] == @enemy.pattern[i]
    end
    matches
  end
end
