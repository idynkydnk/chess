require "pawn"

describe Pawn do
  context "should have possible moves" do
    it "should check all positions" do
      x = Pawn.new
      x.position = [4,4]
      expect(x.possible_moves).to include([4,5])
      expect(x.possible_moves).to include([4,5])
      expect(x.possible_moves).to include([3,4])
      expect(x.possible_moves).to include([5,4])
      expect(x.possible_moves).to include([5,5])
      expect(x.possible_moves).to include([3,5])
      expect(x.possible_moves).not_to include([7,8])
      expect(x.possible_moves).not_to include([2,3])
      expect(x.possible_moves).not_to include([4,6])
      expect(x.possible_moves).not_to include([1,4])
    end

  end
end
