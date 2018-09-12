module SlidingPiece
  HORIZONTAL_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  DIAG_DIRS= [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  
  def moves
    #makes array of possible positions piece can go from starting pos
    pos_moves = [] 
    self.move_dirs.each do |change|
      curent_pos = @pos
      current_pos = [current_pos.first + change.first, current_pos.last + change.last]
      while current_pos.first.between?(0,7) && current_pos.last.between?(0,7)
        pos_moves << current_pos
        current_pos = [current_pos.first + chang e.first, current_pos.last + change.last]
      end
    end
    pos_moves
      # x, y = change[0][1]
    end
  end
  
  
end

class Queen < Piece
  include SlidingPiece
  
  def move_dirs
    SlidingPiece::HORIZONTAL_DIRS + SlidingPiece::DIAG_DIRS
  end
  
end

class Rook < Piece
  include SlidingPiece
  
  def move_dirs #tells which directions specific piece can go in  
    SlidingPiece::HORIZONTAL_DIRS
  end
end

class Bishop < Piece
  include SlidingPiece
  
  def move_dirs
    SlidingPiece::DIAG_DIRS
  end
end