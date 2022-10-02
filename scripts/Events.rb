require 'colorize'
require_relative('./game.rb')
require_relative('./GetString')

module Events
    extend GetString
    # announce a lose/win situation
    def announce_result(comparison_result)
        if comparison_result == true
            puts "Yey! Player has won!".green
        else
            puts "Oops, it seems like PC has won.".green
        end
        restart_or_quit
    end

    # restart or quit the game
    def restart_or_quit
        puts 'Do you wanna play again?'
        answer = get_one_char('y', 'n')
        if answer == 'y'
            Game.start
        else
            puts 'See you next time!'.green
            exit(1)
        end
    end
end