class Piece
  def initialize(name, pos)
    @name = name
    @pos = pos
  end
  
  def inspect
    "#{@pos}"
  end
end