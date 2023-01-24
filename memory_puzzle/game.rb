require_relative "board"


class Game

    attr_reader :board, :prev_guess

    def initialize
        @board = Board.new()
        @prev_guess = nil
    end

    def play
        @board.populate
        until @board.won?
            system("clear")
            @board.render
            guess = get_guess
            make_guess(guess)
        end
    end

    def make_guess(guess)
        if @prev_guess == nil
            @prev_guess = guess
            @board[guess].reveal
        else
            this_guess = guess
            card_1 = @board[@prev_guess]
            card_2 = @board[this_guess]
            card_2.reveal
            system("clear")
            @board.render
            if (card_1.face_value != card_2.face_value) || (@prev_guess == this_guess)
                puts "Try Again"
                card_1.hide
                card_2.hide
            else
                puts "It's a match!"
            end
            @prev_guess = nil
            sleep 2
        end
    end

    def get_guess
        puts "Please enter the position of the card you would like to flip (e.g., (1, 2))"
        guess = gets.chomp.split(",").map(&:to_i)
    end


end