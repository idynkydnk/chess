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

    it "should not be able to move two spots from not the start, black" do
      x = Pawn.new("black", [5,6])
      x.position = [5,5]
      expect(x.possible_moves).to include([5,4])
      expect(x.possible_moves).not_to include([5,3])
    end
  end
  
  describe ".clear_path?" do
    it "should return false when trying to go diagonal without capturing" do
      game = Chess.new
      x = game.board.grid[0][1]
      expect(x.clear_path?(game.board.grid, 1, 2)).to be(false)
    end

    it "should return true when trying to go diagonal up to capture" do
      game = Chess.new
      x = game.board.grid[0][1]
      y = game.board.grid[0][6]
      game.board.place_piece([1,2], y)
      expect(x.clear_path?(game.board.grid, 1, 2)).to be(true)
    end

    it "should return true when trying to go diagonal down to capture" do
      game = Chess.new
      x = game.board.grid[0][1]
      y = game.board.grid[0][6]
      game.board.place_piece([1,5], x)
      expect(y.clear_path?(game.board.grid, 1, 5)).to be(true)
    end

    it "should return false when moving two spots up passing another piece " do
      game = Chess.new
      x = game.board.grid[0][1]
      y = game.board.grid[0][6]
      game.board.place_piece([0,2], y)
      expect(x.clear_path?(game.board.grid, 0, 3)).to be(false)
    end

    it "should return false when moving one spot up to capture " do
      game = Chess.new
      x = game.board.grid[0][1]
      y = game.board.grid[0][6]
      game.board.place_piece([0,2], y)
      expect(x.clear_path?(game.board.grid, 0, 2)).to be(false)
    end

    it "should return false when moving one spot down to capture " do
      game = Chess.new
      x = game.board.grid[0][1]
      y = game.board.grid[0][6]
      game.board.place_piece([0,5], x)
      expect(y.clear_path?(game.board.grid, 0, 5)).to be(false)
    end

    it "should return false when moving 2 spots down passing another piece " do
      game = Chess.new
      x = game.board.grid[0][1]
      y = game.board.grid[0][6]
      game.board.place_piece([0,5], x)
      expect(y.clear_path?(game.board.grid, 0, 4)).to be(false)
    end

  end 
end
