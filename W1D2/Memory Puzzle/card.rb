require 'byebug'

class Card
  attr_reader :value, :face_up
  def initialize(value, face_up = false)
    @value, @face_up = value, face_up
  end

  def self.make_stack(num)
    debugger
    cards = Array.new(num / 2)
    cards.map do |card| #they mapped through values
      card = Card.new(("a".."z").to_a.sample)
    end

    cards = cards.concat(cards)
    cards.shuffle
  end

  def hide

    @face_up = false
  end

  def reveal

    @face_up = true
    @value
  end

  def to_s
    #face_up? ? @value.to_s : ""
  end

  def ==(card)
    self.value == card.value
  end

  def display
    @value if @face_up
  end
end
