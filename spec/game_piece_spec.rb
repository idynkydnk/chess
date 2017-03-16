require "game_piece"

describe GamePiece do
  context "should be able to set coortinates" do
    it "defaults to [0,0]" do
      x = GamePiece.new
      expect(x.position).to eql([0,0])
    end

    it "sets coordinates to [2,5]" do
      x = GamePiece.new([2,5])
      expect(x.position).to eql([2,5])
    end
  end
end
