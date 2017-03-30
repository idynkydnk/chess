require "pawn"

describe Pawn do
  context "on initialization" do
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

  describe ".icon" do
    it "should get the correct icon, white" do
      x = Pawn.new("white", [3,4])
      expect(x.icon).to eql("♙ ".white.bg_black)
    end

    it "should get the correct icon, black" do
      x = Pawn.new("black", [3,4])
      expect(x.icon).to eql("♟ ".black.bg_white)
    end
  end
end
