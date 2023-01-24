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


end