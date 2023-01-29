require "pry-byebug"

class Players
    def initialize(name)
        @name = name
    end
    def printName
        @name
    end

end

class Game
    def initialize
        @code_board = Array.new(4, "_")
        @feedback_board = Array.new(4)
        @answer_board = Array.new(4, "_")
        @current_answer_board = Array.new(4, "_")
        @round_count = 0
    end

    def displayCodeBoard
        @code_board.each do |value|
            print "#{value} "
        end
        puts "\n"
    end
    def displayFeedbackBoard
        puts "This is the feedback boar: "
        @feedback_board.each do |value|
            print "#{value} "
        end
        puts "\n"
    end




    def createCode
        puts "Hello Code mastermind! Please enter your code(secretly!)"
        puts "Please seperate the color codes with spaces: "
        @answer_board = gets.chomp.split(" ")
    end
    def checkWinner(player1, player2)
        if @feedback_board == ["red", "red", "red", "red"]
            p "#{player1.printName} wins!"
        elsif @round_count == 3
            p "The final round has concluded without the secret code being revealed. Mastermind #{player2.printName} wins!"
        else
            turn(player1,player2)
        end
        
    end

    def turn(player1,player2)
        @round_count += 1
        p "Round #{@round_count} of 12"
        @feedback_board.clear

        @current_answer_board.each_with_index{ |variable, index| @current_answer_board[index]= @answer_board[index]}
        puts "#{player1}, please enter your guess at the secret code.\n Enter all 4 color names seperated by spaces: "              # R B R L
                                                                                                                                    # B Y R L 
        player1_guess = gets.chomp.split(" ")
        player1_guess.each_with_index do |value, index|
            if player1_guess[index] == @current_answer_board[index]
                @feedback_board << "red"
                player1_guess[index] = "checked"
                @current_answer_board[index] = "checked"
            end
        end


        player1_guess.each_with_index do |value, index|
            
            answer_index = nil
            answer_index = @current_answer_board.find_index(value)
            if (answer_index !=nil && player1_guess[index] != "checked")
                @feedback_board << "white"
                player1_guess[index] = "checked"
                @current_answer_board[answer_index] = "checked"
            end
        end

        displayCodeBoard
        displayFeedbackBoard
        checkWinner(player1, player2)


        
        
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
