require 'colorize'
module GetString
  # allowed pegs in a pattern
  @@allowed_pegs = ['1', '2', '3', '4', '5', '6']
  # pegs which are allowed in the exact game session
  @@this_game_allowed_pegs = [].concat(@@allowed_pegs)

  # get one character out of 2 allowed ones
  def get_one_char(allowed1, allowed2)
    sleep(0.1)
    puts "Input #{allowed1} or #{allowed2}".blue
    loop do
      char = gets.chomp.downcase
      return char if char == allowed1 || char == allowed2

      puts "You should input #{allowed1} or #{allowed2}".red
    end
  end

  # ask a player if duplicates are allowed
  def duplicates?
    get_one_char('y', 'n') == 'y'
  end

  # ask a player if spaces are allowed
  def spaces?
    if get_one_char('y', 'n') == 'y'
      @@this_game_allowed_pegs.push(' ')
    elsif @@this_game_allowed_pegs.include?(' ')
      @@this_game_allowed_pegs.delete(' ')
    end
  end

  # get player pattern
  def get_six_char_string(duplicates_allowed)
    pattern = []
    print "Your pattern can include only #{@@this_game_allowed_pegs} pegs. "
    sleep(0.1)
    print 'Duplicates allowed'.blue if duplicates_allowed
    print "\n"
    loop do
      pattern = gets.chomp.split('')
      break if valid?(pattern, duplicates_allowed)
    end
    pattern
  end

  # checks if the pattern is valid
  def valid?(pattern, duplicates_allowed)
    allowed = false

    unless pattern.length == 4
      puts "Your patters's length is invalid, input just 4 pegs".red
      return allowed
    end

    pattern.each do |peg|
      unless @@this_game_allowed_pegs.include?(peg)
        puts "Your pattern has a disallowed peg. Only input #{@@this_game_allowed_pegs} pegs".red
        return allowed
      end
    end

    if !duplicates_allowed && pattern.uniq != pattern
      puts "Your pattern can't include duplicates".red
      return allowed
    end

    allowed = true
  end

  # generate a random pattern
  def generate_random_str(duplicates_allowed)
    pattern = []
    loop do
      pattern.push(@@this_game_allowed_pegs.sample)
      pattern.pop if !duplicates_allowed && pattern.uniq != pattern
      break if pattern.length == 4
    end
    pattern
  end
end
