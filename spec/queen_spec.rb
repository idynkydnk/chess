require "queen"

describe Queen do
  context "should have possible moves" do
    it "should check all moves right horizontal" do
      x = Queen.new
      expect(x.possible_moves).to include([1,0])
      expect(x.possible_moves).to include([7,0])
      expect(x.possible_moves).not_to include([8,0])
    end

    it "should check left moves" do
      x = Queen.new
      expect(x.possible_moves).not_to include([-1,0])
      expect(x.possible_moves).not_to include([0,0])

    end
  end
end
