require_relative 'Tile'

class Board

  def initialize(grid=Board.from_file)
    @grid = grid
  end

  def self.from_file
    file = File.readlines("sudoku1.txt").map(&:chomp)
    file.map! {|el| el.split("")}
    file.map do |row|
      row.map! {|value| Tile.new(value.to_i)}
    end
  end

  def update_val(pos, new_val)
    @grid[pos].value = new_val
  end

  def render
    @grid.each do |row|
      row_str = ""
      row.each do |tile|
        row_str += tile.value == 0 ? "X" : tile.value.to_s #replace unsolved 0's w X
      end
      p row_str
    end
    return
  end

  def solved?
    #if no zeros, and if
    false if @grid.flatten.any? {|tile| tile.value == 0}
  end

  def row_solved?

  end

  def col_solved?

  end

  def sq_solved?

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
end
