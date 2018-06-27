require 'TDD'

describe "#my_uniq" do
  context "array has duplicates" do
    it "removes duplicate elements in array" do
      expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
    end
  end
  
  context "array has no duplicates" do
    it "doesn't do anything to array" do
      expect(my_uniq([1,2,3])).to eq([1,2,3])
    end
  end
end

describe Array do
  describe "#two_sum" do
    it "finds all pairs of positions where elements there sum to 0" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
  
  it "will convert between the row-oriented and column-oriented representations" do
    expect(my_transpose(rows)).to eq(rows.transpose)
  end
end

describe "#stock_picker" do
  prices = [75, 25, 100, 50, 10, 0]
  context "there is profit to be made" do
    it "returns most profit of buying and selling stock" do
      expect(stock_picker(prices)).to eq([1,2])
    end
    
    it "buy and sells are chronological" do
      expect(stock_picker(prices)).to eq(stock_picker(prices).sort)
    end
  end
end