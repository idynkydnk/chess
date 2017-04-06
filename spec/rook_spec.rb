require "rook"

describe Rook do
  context "should have possible moves" do
    it "should check all moves" do
      x = Rook.new("white", [0,0])
      x.position = [1,3]
      expect(x.possible_moves).to include([1,7])
      expect(x.possible_moves).to include([7,3])
      expect(x.possible_moves).not_to include([8,0])
      expect(x.possible_moves).not_to include([2,4])
    end
  end
end
