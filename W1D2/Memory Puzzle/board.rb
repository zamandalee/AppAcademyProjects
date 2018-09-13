require 'byebug'
require_relative "card"


class Board

  def initialize
    @card_stack = Card.make_stack(16)#contains Card instances
    @board = Array.new(4) {Array.new(4)}
    #@board = Array.new(4) {[Card.new], [Card.new], [Card.new], [Card.new]}
  end

  def populate
    card_idx = 0 #don't need card_idx, can just do #card_stack.pop
    @board.each_index do |row|
      @board[row].each_index do |col|
        @board[row][col] = @card_stack[card_idx]
        card_idx += 1
      end

    end

    @board
  end

  def render
    p @board
  end

  def won?
    @board.flatten.all? {|card| card.face_up }
  end

  def reveal(guess_pos)
    @board[guess_pos].reveal
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
