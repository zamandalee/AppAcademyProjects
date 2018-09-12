require 'card'

describe Card do
  subject(:card) { Card.new("5", "diamonds")}
   
  describe "#initialize" do
    it "sets card value" do
      expect(card.value).to eq("5")
    end
    
    it "sets card suit" do
      expect(card.suit).to eq("diamonds")
    end
  end

end 