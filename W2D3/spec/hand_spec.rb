require "hand"

describe Hand do
  subject(:sample_hand) {Hand.new}
  
  describe "#initialize" do
    it "initializes hand as an empty array" do
      expect(sample_hand.hand).to be_empty
    end
  end
end