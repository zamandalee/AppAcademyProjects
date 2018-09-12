require_relative "Piece"
class Board
  
  def default(board)
    board.each_with_index do |row, idx|
      next if idx > 1 && idx < 6
      row.each_with_index do |col, jdx|
        board[idx][jdx] = Piece.new("Piece", [idx, jdx])
      end 
    end 
    board 
  end
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid = default(@grid)
  end
  
  def move_piece(start_pos, end_pos)
    raise "Empty start position" if self[start_pos].nil?
    raise "Piece can't move to end position" unless self[end_pos] == nil

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos] 
  end
  
  def valid_pos?(position)
    return true if position.first.between?(0,7) && position.last.between?(0,7)
    return false
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
  
  
  
  # private
  attr_reader :grid

end

test = Board.new