require "queen"

describe Queen do
  context "should have possible moves" do
    it "should check all moves right horizontal" do
      x = Queen.new("white", [0,0])
      expect(x.possible_moves).to include([1,0])
      expect(x.possible_moves).to include([7,0])
      expect(x.possible_moves).not_to include([8,0])
    end

    it "should check left moves" do
      x = Queen.new("white", [0,0])
      x.position = [4,5]
      expect(x.possible_moves).to include([0,5])
      expect(x.possible_moves).to include([3,5])
      expect(x.possible_moves).not_to include([0,0])
      expect(x.possible_moves).not_to include([-1,0])
    end

    it "should check up moves" do
      x = Queen.new("white", [0,0])
      x.position = [4,5]
      expect(x.possible_moves).to include([4,6])
      expect(x.possible_moves).to include([4,7])
    end

    it "should check down moves" do
      x = Queen.new("white", [0,0])
      x.position = [7,7]
      expect(x.possible_moves).to include([7,6])
      expect(x.possible_moves).to include([7,1])
      expect(x.possible_moves).not_to include([7,7])
      expect(x.possible_moves).not_to include([4,3])
    end

    it "should check diagonal up moves" do
      x = Queen.new("white", [0,0])
      x.position = [0,0]
      expect(x.possible_moves).to include([1,1])
      expect(x.possible_moves).to include([7,7])
      expect(x.possible_moves).not_to include([7,8])
      expect(x.possible_moves).not_to include([2,3])
    end

    it "should check diagonal down moves" do
      x = Queen.new("white", [0,0])
      x.position = [3,7]
      expect(x.possible_moves).to include([4,6])
      expect(x.possible_moves).to include([5,5])
      expect(x.possible_moves).not_to include([7,8])
      expect(x.possible_moves).not_to include([2,3])
    end

    it "should check diagonal left up moves" do
      x = Queen.new("white", [0,0])
      x.position = [3,1]
      expect(x.possible_moves).to include([2,2])
      expect(x.possible_moves).to include([1,3])
      expect(x.possible_moves).not_to include([7,8])
      expect(x.possible_moves).not_to include([2,3])
    end

    it "should check diagonal left down moves" do
      x = Queen.new("white", [0,0])
      x.position = [7,7]
      expect(x.possible_moves).to include([2,2])
      expect(x.possible_moves).to include([4,4])
      expect(x.possible_moves).not_to include([7,8])
      expect(x.possible_moves).not_to include([2,3])
    end

    it "should have color of white" do
      x = Queen.new("white", [3,4])
      expect(x.color).to eql("white")
    end

  end
end
