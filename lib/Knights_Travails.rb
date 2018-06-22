require_relative "00_tree_node"

class KnightsTravails
  # attr_reader :start_pos, :board
  
  def initialize(start_pos)
    @start_pos = start_pos
    @board = Array.new(8) {Array.new(8)}
    @visited_positions = [@start_pos]
  end
  

  def self.valid_moves(pos)
    valid_moves = []
    row, col = pos
    neighbors = [[row -1, col -1], [row -1, col], 
                 [row - 1, col + 1], [row, col - 1], 
                 [row, col + 1], [row + 1, col - 1],
                 [row + 1, col], [row + 1, col + 1]]
    neighbors.each do |pair|
      valid_moves << pair if in_range?(pair.first, pair.last) 
    end 
    valid_moves
  end
  
  def new_move_positions(pos)
    self.valid_moves(pos)
  end
  
  private 
  
  def self.in_range?(num1, num2)
    (0...8).include?(num1) && (0...8).include?(num2)
  end
end

