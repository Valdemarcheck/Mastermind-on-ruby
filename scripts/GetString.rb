module GetString
    # allowed signs in a pattern
    @@allowed_signs = ['1', '2', '3', '4', '5', '6']
    @@this_game_allowed_signs = [].concat(@@allowed_signs)

    # get one character out of 2 allowed ones
    def get_one_char(allowed1, allowed2)
        puts "Input #{allowed1} or #{allowed2}"
        loop do
            char = gets.chomp.downcase
            if char == allowed1 || char == allowed2
                return char
            else
                puts "You should input #{allowed1} or #{allowed2}"
            end
        end
    end

    # ask a player if duplicates are allowed
    def duplicates?
        return get_one_char('y', 'n') == 'y' ? true : false
    end

    # ask a player if spaces are allowed
    def spaces?
        if get_one_char('y', 'n') == 'y'
            @@this_game_allowed_signs.push(' ')
        end
    end

    # get player pattern
    def get_six_char_string(duplicates_allowed)
        pattern = Array.new
        puts "Input a 6 character long string, that can include only #{@@this_game_allowed_signs} signs. "
        print "Duplicates allowed" if duplicates_allowed
        loop do
            pattern = gets.chomp.split('')
            break if valid?(pattern, duplicates_allowed)
        end
        pattern
    end

    # checks if the pattern is valid
    def valid?(pattern, duplicates_allowed)
        allowed = false

        unless pattern.length == 6
            puts "Your patters's length is invalid, input just 6 signs"
            return allowed
        end

        pattern.each do |sign|
            if !pattern.include?(sign)
                puts "Your pattern has a disallowed sign. Only input #{this_game_allowed_signs} signs"
                return allowed
            end
        end

        if !duplicates_allowed && pattern.uniq != pattern
            puts "Your pattern can't include duplicates"
            return allowed
        end

        allowed = true
    end

    # generate a random pattern
    def generate_random_str(duplicates_allowed)
        pattern = []
        loop do
            pattern.push(@@this_game_allowed_signs.sample)
            if !duplicates_allowed && pattern.uniq != pattern
                pattern.pop
            end
            break if pattern.length == 6
        end
        p pattern
        pattern
    end

end