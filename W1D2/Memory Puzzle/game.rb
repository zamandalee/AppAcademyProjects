require_relative "card"
require_relative "board"

class Game
  def initialize(board)
    @board = board
    @previous_guess = nil
  end
  
  def play
    until over?
      system("clear")
      @board.render
      pos = guess
      make_guess(pos)
    end
  end
  
  def over?
    @board.won?
  end
  
  def guess
    puts "Guess a position: "
    guess_pos = gets.chomp
    guess_pos
  end
  
  def make_guess(pos)
    current_guess = @board[pos]
    if @previous_guess.nil?
      @previous_guess = current_guess 
      @previous_guess.reveal
    else   
      if current_guess == @previous_guess
        current_guess.reveal
      else 
        sleep(2)
        @previous_guess.hide
        current_guess.hide 
      end 
      reset_guess
    end 
  end
  
  def reset_guess
    @previous_guess = nil   
  end
  
end 