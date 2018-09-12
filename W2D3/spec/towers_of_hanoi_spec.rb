require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:toh) {TowersOfHanoi.new}
  
  describe "#initialize" do
    it "initializes towers and fills only first tower with disks" do
      expect(toh.towers[0]).to_not be_empty
      expect(toh.towers[1]).to be_empty
      expect(toh.towers[2]).to be_empty
    end
  end
  
  describe "#move" do
    before :each do
      toh.move([0,1])
    end
    
    it "moves disc if move is valid" do
      expect(toh.towers[1].length).to eq(1)
    end
    
    it "reprompt user if move is not valid" do
      toh.move([0,1]) 
      expect(toh.towers[1].length).to eq(1)
    end
  end

  describe "#won?" do
    context "all disks are moved to either towers 1 or 2" do      
      it "returns true and exits the until loop in play" do
        toh.towers[0] = []
        toh.towers[1] = [1, 2, 3, 4]
        expect(toh.won?).to be true
      end
    end
    
    context "all disks have not been moved to one tower" do
      it "returns false" do
        expect(toh.won?).to be false 
      end
    end
  end
end