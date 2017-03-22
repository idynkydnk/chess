require "knight"

describe Knight do
  context "should inherent gamepieces position" do
    it "has default position of 0,0" do
      x = Knight.new
      expect(x.position).to eql([0,0])
    end

    it "should have 2,3 in list of possible moves" do
      x = Knight.new([1,1])
      expect(x.possible_moves).to include([2,3])
    end

    it "should have 7,7 in list of possible moves" do
      x = Knight.new([6,5])
      x.position = [1,1]
      expect(x.possible_moves).to include([2,3])
      expect(x.possible_moves).to include([3,2])
      x.position = [4,4]
      expect(x.possible_moves).to include([5,6])
    end
  end
end
