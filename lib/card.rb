class Card 
  attr_reader :value, :suit, :color 
  
  CARD_VALES = {"A": 11, "K": 10, "Q": 10, "J": 10, 
                "10": 10, "9": 9, "8": 8, "7": 7, 
                "6": 6, "5": 5, "4": 4, "3": 3, "2": 2}
                
  def initialize(value, suit)
    @value = value
    @suit = suit 
  end
end 