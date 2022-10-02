require 'colorize'
module Text
    # print rules of the game
    def announce_beginning
        puts "#{"Hello!".yellow} You're about to play an implementation of Mastermind by #{"Valdemar_check".yellow}"
        sleep(2)
        puts "(e.g. an author of this script)"
    end

    def ask_for_rules
        puts "Should I explain rules to you?".yellow
    end

    def explain_rules
        puts "The object of Mastermind is to guess a secret code consisting of a series of 4".yellow
        sleep(2)
        puts "colored pegs. Each guest results in feedback narrowing down the possibilities of the".yellow
        sleep(2)
        puts "code. The winner is the player who solves his opponent's secret code with fewer".yellow
        sleep(2)
        puts "guesses".yellow
        sleep(1)
    end

    def ask_for_duplicates
        sleep(1)
        puts "Will #{"duplicates".yellow} be allowed in patterns?"
        sleep(1)
    end

    def ask_for_spaces
        sleep(1)
        puts "Will #{"spaces".yellow} be allowed in patterns?"
        sleep(1)
    end

    def print_divider
        puts "================================"
    end

    def ask_player_pattern
        puts "Please input a 4 character long pattern".blue
    end

    def announce_matches(matches)
        if !matches.zero?
            puts "#{"#{matches}".yellow} of your signs matched with enemy's signs!"
        else
            puts "None of your signs matched with enemy's signs..."
        end
    end

    def announce_start
        puts "Ok, We're all set! Have fun!".green
    end

end