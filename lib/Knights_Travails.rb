require_relative "00_tree_node.rb"
require 'byebug'

class KnightsTravails
  attr_reader :start_pos, :board
  
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
    moves = KnightsTravails.valid_moves(pos)
    moves.reject! {|move| @visited_positions.include?(move)}
    @visited_positions += moves
    moves
  end
    
  def build_move_tree
    root = PolyTreeNode.new(self.start_pos)

    queue = [root]
    
    until queue.empty?
      #pop node from queue
      current = queue.shift  
      
      child_vals = new_move_positions(current.value)
      child_nodes = child_vals.map { |val| PolyTreeNode.new(val)}
      # Create child nodes and make recently shifted node the parent
      child_nodes.each do |node| 
        node.parent = current
      end
      queue.concat(child_nodes)
      #add children to queue UNLESS alr in queue (moves are already visited)
      #repeat for the kids, without visiting same positions again
    end 
    
    root
  end
  
  # def inspect
  #   self.children.each do |el|
  # 
  #   end
  #   "#{self.children}"
  # end
  
  private 
  
  def self.in_range?(num1, num2)
    (0...8).include?(num1) && (0...8).include?(num2)
  end
end

