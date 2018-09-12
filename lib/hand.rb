require_relative "Deck"

class Hand
  attr_reader :hand
  
  def initialize
    @hand = []
  end
  
  def deal
    until hand.length == 5
      hand << deck.pop
    end
  end
  
  def pair?
    hand.any? { |el| hand.count(el) == 2 }  
  end 
  
  def three_of_a_kind?
    hand.any? { |el| hand.count(el) == 3 }  
  end
  
  def two_pair?
  end
end