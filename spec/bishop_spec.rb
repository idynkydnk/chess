require "bishop"

describe Bishop do
  context "should have possible moves" do
    it "should check all moves" do
      x = Bishop.new("white",[3,3])
      x.position = [1,3]
      expect(x.possible_moves).to include([2,4])
      expect(x.possible_moves).to include([3,5])
      expect(x.possible_moves).not_to include([8,0])
      expect(x.possible_moves).not_to include([2,5])
    end
  end

  describe ".clear_path?" do
    it "should return false when path is blocked going up right" do
      game = Chess.new
      x = game.board.grid[2][0]
      expect(x.clear_path?(game.board.grid, 4, 2)).to be(false)
    end

    it "should return true when path is clear going up" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([3,3], x)
      x.position = [3,3]
      expect(x.clear_path?(game.board.grid, 3, 5)).to be(true)
    end
  end
end
