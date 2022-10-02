require 'colorize'
module Text
    # print rules of the game
    def announce_beginning
        puts "#{"Hello!".yellow} You're about to play an implementation of Mastermind by #{"Valdemar_check".yellow}"
        sleep(2)
        puts "(e.g. an author of this script)"
        sleep(0.5)
    end

    def ask_for_rules
        puts "Should I explain rules to you?"
    end

    def explain_rules
        # finish it later
    end

    def ask_for_duplicates
        puts "Will #{"duplicates".yellow} be allowed in patterns?"
    end

    def ask_for_spaces
        puts "Will #{"spaces".yellow} be allowed in patterns?"
    end

    def print_divider
        puts "================================"
        sleep(0.1)
    end

    def ask_player_pattern
        puts "Please input a 6 character long pattern".blue
        sleep(0.1)
    end

    def announce_matches(matches)
        if !matches.zero?
            puts "#{matches} of your signs matched with enemy's signs!"
        else
            puts "None of your signs matched with enemy's signs..."
        end
        sleep(0.1)
    end

    def announce_start
        puts "Ok, We're all set! Have fun!".green
        sleep(0.1)
    end

end