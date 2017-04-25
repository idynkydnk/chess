require "rook"

describe Rook do
  context "should have possible moves" do
    it "should check all moves" do
      x = Rook.new("white", [0,0])
      x.position = [1,3]
      expect(x.possible_moves).to include([1,7])
      expect(x.possible_moves).to include([7,3])
      expect(x.possible_moves).not_to include([8,0])
      expect(x.possible_moves).not_to include([2,4])
    end
  end

  describe ".clear_path?" do
    it "should return false when path is blocked going up" do
      game = Chess.new
      x = game.board.grid[0][0]
      expect(x.clear_path?(game.board.grid, 0, 3)).to be(false)
    end

    it "should return true when path is clear going up" do
      game = Chess.new
      x = game.board.grid[0][0]
      game.board.place_piece([0,3], x)
      x.position = [0,3]
      expect(x.clear_path?(game.board.grid, 0, 5)).to be(true)
    end

    it "should return false when path is blocked going down" do
      game = Chess.new
      x = game.board.grid[0][0]
      game.board.place_piece([3,3], x)
      x.position = [3,3]
      expect(x.clear_path?(game.board.grid, 3, 0)).to be(false)
    end

    it "should return true when path is clear going down" do
      game = Chess.new
      x = game.board.grid[0][0]
      game.board.place_piece([3,5], x)
      x.position = [3,5]
      expect(x.clear_path?(game.board.grid, 3, 3)).to be(true)
    end

    it "should return true when path is clear going right" do
      game = Chess.new
      x = game.board.grid[0][0]
      game.board.place_piece([3,5], x)
      x.position = [3,5]
      expect(x.clear_path?(game.board.grid, 6, 5)).to be(true)
    end

    it "should return false when path is blocked going right" do
      game = Chess.new
      x = game.board.grid[3][0]
      expect(x.clear_path?(game.board.grid, 6, 0)).to be(false)
    end
  end
end
