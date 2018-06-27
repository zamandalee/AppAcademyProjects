class TowersOfHanoi
  attr_reader :towers
  
  def initialize
    @towers = Array.new(3) {[]}
    fill_tower
  end
  
  def move(input)
    start_tower = towers[input.first]
    end_tower = towers[input.last]
    
    if valid_move?(start_tower, end_tower)
      disc = start_tower.shift
      end_tower.unshift(disc)
    else
      puts "Sorry, not a valid move. Try again."
    end 
  end
  
  def play
    until won?
      get_input
    end 
    
    puts "You win! Good job."
  end
  
  def get_input
    puts "Enter a start and end position"
    user_move = gets.chomp.split(",")
    
    move(user_move) 
  end 
  
  def won?
    if towers[0].empty?
      return true if towers[1].length == 4 || towers[2].length == 4
    end
    false
  end
  
  private 
  
  def fill_tower
    @towers[0] = [1,2,3,4]
  end
  
  def valid_move?(start_tower, end_tower)
    return false if start_tower.empty? 
    
    unless end_tower.empty? 
      return false if start_tower.first > end_tower.first
    end 
    
    true 
  end
end 





