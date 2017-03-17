require "queen"

describe Queen do
  context "should have possible moves" do
    it "should have move 0,1" do
      x = Queen.new
      expect(x.possible_moves).to include([1,0])
      expect(x.possible_moves).to include([7,0])
      expect(x.possible_moves).not_to include([8,0])
    end
  end
end
