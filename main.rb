class Players
    def initialize(name)
        @name = name
    end

end

class Game
    def initialize
        @code_board = Array.new(4, "_")
        @feedback_board = Array.new(4, "_")
        @answer_board = Array.new(4, "_")
    end

    def display_code_board
        @code_board.each do |value|
            print "#{value} "
        end
        puts "\n"
    end
    def create_code
        puts "Hello Code mastermind! Please enter your code(secretly!)"
        puts "Please seperate the color codes with spaces: "
        @answer_board = gets.chomp.split(" ")
    end

end


def getPlayerName(player1, player2)
    if player1 != nil
        puts "Player 2 the code master, please type your name below"
    else
        puts "Player 1 the code guesser, please type your name below"
    end
    
    return gets.chomp
    
end




player1 = nil
player2 = nil

player1 = Players.new(getPlayerName(player1, player2))
player2 = Players.new(getPlayerName(player1, player2))
game = Game.new
game.create_code
game.display_code_board
