require "game_piece"

describe GamePiece do
  context "should be able to set coortinates" do
    it "sets coordinates to 1,4, and color to white" do
      x = GamePiece.new("white", [1,5])
      expect(x.position).to eql([1,5])
      expect(x.color).to eql("white")
    end

    it "sets coordinates to [2,5], and color to black" do
      x = GamePiece.new("black", [2,5])
      expect(x.position).to eql([2,5])
      expect(x.color).to eql("black")
    end
  end
end
