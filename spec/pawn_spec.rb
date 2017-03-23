require "pawn"

describe Pawn do
  context "should have possible moves" do
    it "should check all positions" do
      x = Pawn.new("black", [3,3])
      expect(x.possible_moves).to include([3,2])
      expect(x.possible_moves).not_to include([3,4])
    end

    it "should be able to move two spots from the start" do
      x = Pawn.new("white", [3,1])
      expect(x.possible_moves).to include([3,3])
      expect(x.possible_moves).not_to include([3,4])
    end

    it "should be able to move two spots from the start, black" do
      x = Pawn.new("black", [5,6])
      expect(x.possible_moves).to include([5,4])
      expect(x.possible_moves).not_to include([3,4])
    end
  end
end
