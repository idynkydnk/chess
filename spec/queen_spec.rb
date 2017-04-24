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

  describe ".clear_path?" do
    it "should return false when path is blocked going up" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([3,3], x)
      x.position = [3,3]
      expect(x.clear_path?(game.board.grid, 3, 8)).to be(false)
    end

    it "should return true when path is clear going up" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([3,3], x)
      x.position = [3,3]
      expect(x.clear_path?(game.board.grid, 3, 5)).to be(true)
    end

    it "should return false when path is blocked going down" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([3,3], x)
      x.position = [3,3]
      expect(x.clear_path?(game.board.grid, 3, 0)).to be(false)
    end

    it "should return true when path is clear going down" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([3,6], x)
      x.position = [3,6]
      expect(x.clear_path?(game.board.grid, 3, 3)).to be(true)
    end

    it "should return true when path is clear going right" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([3,5], x)
      x.position = [3,5]
      expect(x.clear_path?(game.board.grid, 6, 5)).to be(true)
    end

    it "should return false when path is blocked going right" do
      game = Chess.new
      x = game.board.grid[3][0]
      expect(x.clear_path?(game.board.grid, 6, 0)).to be(false)
    end

    it "should return false when path is blocked going left" do
      game = Chess.new
      x = game.board.grid[3][0]
      expect(x.clear_path?(game.board.grid, 1, 0)).to be(false)
    end

    it "should return true when path is clear going left" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([3,5], x)
      x.position = [3,5]
      expect(x.clear_path?(game.board.grid, 1, 5)).to be(true)
    end

    it "should return true when path is clear going diagonally up right" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([0,2], x)
      x.position = [0,2]
      expect(x.clear_path?(game.board.grid, 2, 4)).to be(true)
    end

    it "should return false when path is blocked going diagonally up right" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([0,2], x)
      x.position = [0,2]
      expect(x.clear_path?(game.board.grid, 5, 7)).to be(false)
    end

    it "should return true when path is clear going diagonally up left" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([4,2], x)
      x.position = [4,2]
      expect(x.clear_path?(game.board.grid, 2, 4)).to be(true)
    end

    it "should return false when path is blocked going diagonally up left" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([4,4], x)
      x.position = [4,4]
      expect(x.clear_path?(game.board.grid, 1, 7)).to be(false)
    end

    it "should return false when path is blocked going diagonally down left" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([4,4], x)
      x.position = [4,4]
      expect(x.clear_path?(game.board.grid, 0, 0)).to be(false)
    end

    it "should return true when path is clear going diagonally down left" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([4,4], x)
      x.position = [4,4]
      expect(x.clear_path?(game.board.grid, 2, 2)).to be(true)
    end

    it "should return true when path is clear going diagonally down right" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([4,4], x)
      x.position = [4,4]
      expect(x.clear_path?(game.board.grid, 6, 2)).to be(true)
    end

    it "should return false when path is blocked going diagonally down right" do
      game = Chess.new
      x = game.board.grid[3][0]
      game.board.place_piece([2,4], x)
      x.position = [2,4]
      expect(x.clear_path?(game.board.grid, 6, 0)).to be(false)
    end

  end
end
