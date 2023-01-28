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

    def displayCodeBoard
        @code_board.each do |value|
            print "#{value} "
        end
        puts "\n"
    end
    def createCode
        puts "Hello Code mastermind! Please enter your code(secretly!)"
        puts "Please seperate the color codes with spaces: "
        @answer_board = gets.chomp.split(" ")
    end
    def turn(player1,player2)
        puts "#{player1}, please enter your guess at the secret code.\n Enter all 4 color names seperated by spaces: "
        player1_guess = gets.chomp.split(" ")
        player1_guess.each_with_index do |value, index|
            if answer_board.any? { |answer| answer == value}
                player1_guess.each_with_index do |actual_guess, actual_index|
                    answer_board.each_with_index do |actual_answer, actual_index|
                        #trying to set up all answer to equal player1
                end
            end
        end
        
        
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
game.createCode
game.displayCodeBoard
game.turn(player1, player2)
