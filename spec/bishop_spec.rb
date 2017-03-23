require "bishop"

describe Bishop do
  context "should have possible moves" do
    it "should check all moves" do
      x = Bishop.new("white",[3,3])
      x.position = [1,3]
      expect(x.possible_moves).to include([1,7])
      expect(x.possible_moves).to include([3,3])
      expect(x.possible_moves).not_to include([8,0])
      expect(x.possible_moves).not_to include([2,5])
    end
  end
end
