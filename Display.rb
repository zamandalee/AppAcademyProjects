require 'colorize'
require 'byebug'
require_relative 'Board'
require_relative 'cursor'
require_relative 'Piece'

class Display
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end 
  
  #board.grid[r_idx][c_idx] = 
  def render 
    system("clear")
    puts "—————————————————————————————————————————"
    board.grid.map.with_index do |row, r_idx|
      row.map.with_index do |square, c_idx|
        if square.is_a?(Piece)
          if [r_idx,c_idx] ==  @cursor.cursor_pos
            print "| ♕  ".colorize(:color => :white, :background => :red)
          else
            print "| ♕  ".colorize(:color => :white, :background => :blue)
          end
        else 
          if [r_idx,c_idx] ==  @cursor.cursor_pos
            print "|    ".colorize(:background => :red)
          else
            print "|    ".colorize(:background => :blue)
          end
        end 
      end 
      puts "|\n—————————————————————————————————————————"
    end 
  end
  
  def highlight
    loop do 
      self.render
      @cursor.get_input
    end 
  end
  
end 

board1 = Board.new
test = Display.new(board1)
test.highlight 
