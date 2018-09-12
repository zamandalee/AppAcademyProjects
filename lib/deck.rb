require_relative 'card'

class Deck
  SUITS = %i(clubs diamonds hearts spades)
  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  
  attr_reader :deck 
  
  def initialize
    @deck = Array.new()
    fill_deck
  end
  
  def fill_deck 
    VALUES.each do |val|
      SUITS.each do |suit|
        deck << Card.new(val, suit)
      end
    end
  end
  
  def shuffle_deck 
    @deck = deck.shuffle
  end
end 