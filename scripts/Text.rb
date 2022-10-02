module Text
    # print rules of the game
    def announce_beginning
        puts "Hello! You're about to play an implementation of Mastermind by Valdemar_check"
        puts "(e.g. an author of this script)"
    end

    def ask_for_rules
        puts "Should I explain rules to you?"
    end

    def explain_rules
        # finish it later
    end

    def ask_for_duplicates
        puts "Will duplicates be allowed in patterns?"
    end

    def ask_for_spaces
        puts "Will spaces be allowed in patterns?"
    end

    def ask_player_pattern
        puts "Player, please, input a 6 character long pattern"
    end

    def announce_start
        puts "Ok, We're all set! Have fun!"
    end

end