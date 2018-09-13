class Tile
  attr_accessor :value
  
  def initialize(value)
    @value = value
    @given = @value == 0 ? false : true
  end 
  
  def to_s
    
  end
  
end 