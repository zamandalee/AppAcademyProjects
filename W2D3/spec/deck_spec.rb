require "deck"

describe Deck do
  subject(:card_deck) { Deck.new }
  
  describe "#initialize" do
    it "initializes a deck of 52" do
      expect(card_deck.deck.length).to eq(52)
    end    
    
    it "fills deck with Card objects" do
      expect(card_deck.deck.first).to be_a(Card)
    end

    it "fills deck with unique cards" do
      expect(card_deck.deck.uniq).to eq(card_deck.deck)
    end
  end
  
  describe "#shuffle" do
    let(:shuffled_deck) { Deck.new }
    
    it "shuffles the order of cards" do
      shuffled_deck.shuffle_deck
      expect(card_deck.deck).to_not eq(shuffled_deck.deck)
    end
  end
end