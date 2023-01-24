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
            
            @prev_guess = @board[guess]
            @prev_guess.reveal
        else
            this_guess = @board[guess]
            this_guess.reveal
            system("clear")
            @board.render
            if (@prev_guess.face_value != this_guess.face_value) && (@prev_guess.object_id == this_guess.object_id)
                puts "Try Again"
                @prev_guess.hide
                this_guess.hide
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