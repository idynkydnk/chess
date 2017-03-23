require "pawn"

describe Pawn do
  context "should have possible moves" do
    it "should check all positions" do
      x = Pawn.new("black", [3,3])
      x.position = [4,4]
      expect(x.possible_moves).to include([4,5])
      expect(x.possible_moves).not_to include([1,4])
    end

  end
end
