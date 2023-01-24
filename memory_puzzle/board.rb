require_relative "card"

class Board
    @@symbols = [:A, :B, :C, :D, :E, :F, :G, :H]
    attr_reader :grid

    def initialize
        @size = 16
        @grid = Array.new(4) {Array.new}
    end

    def populate
        deck = []
        @@symbols.each {|symbol| 2.times {deck << Card.new(symbol)}}
        deck.shuffle!
        (0...4).each do |row|
            (0...4).each do |col|
                @grid[row][col] = deck.shift
            end
        end
    end

    def render
        puts "  0 1 2 3"
        @grid.each_with_index do |row, index|
            row_string = row.map {|card| card.face_flag ? card.to_s : " "}.join(" ")
            puts "#{index} #{row_string}"
        end 
    end

    def won?
        @grid.all? { |row| row.all?(&:face_flag) }
    end

    def reveal(guess_pos)
        return if self[guess_pos].face_flag
        self[guess_pos].reveal
        self[guess_pos].face_value
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end
end