require "board"

describe Board do
  context "sets a 8x8 grid" do
    it "sets 8 rows" do
      board = Board.new
      expect(board.grid.length).to be(8)
    end
     
    it "sets 8 colums" do
      board = Board.new
      board.grid.each do |row|
        expect(row.length).to be(8)
      end
    end
  end

  context "sets the defauld board" do
    it "places all white pieces on bottom" do
      board = Board.new
      expect(board.grid[0][0]).to be_a Rook
      expect(board.grid[1][0]).to be_a Knight
      expect(board.grid[2][0]).to be_a Bishop
      expect(board.grid[3][0]).to be_a Queen
      expect(board.grid[4][0]).to be_a King
      expect(board.grid[5][0]).to be_a Bishop
      expect(board.grid[5][1]).to be_a Pawn
      expect(board.grid[2][1]).to be_a Pawn
      expect(board.grid[0][1]).to be_a Pawn
    end
  end

  it "places all black pieces on top" do
    board = Board.new
    expect(board.grid[0][7]).to be_a Rook
    expect(board.grid[1][7]).to be_a Knight
    expect(board.grid[2][7]).to be_a Bishop
    expect(board.grid[3][7]).to be_a Queen
    expect(board.grid[4][7]).to be_a King
    expect(board.grid[5][7]).to be_a Bishop
    expect(board.grid[5][6]).to be_a Pawn
    expect(board.grid[2][6]).to be_a Pawn
  end

  describe ".place_piece" do
    it "places a piece on the grid A-H,1-8" do
      board = Board.new
      object = double("object")
      board.place_piece([0,0], object)
      expect(board.grid[0][0]).to eql(object)
    end

    it "places a piece from knight class" do
      board = Board.new
      piece = Knight.new("white", [0,0])
      board.place_piece([3,5], piece) 
      expect(board.grid[3][5]).to eql(piece)
      expect(board.grid[3][5]).to be_a Knight 
    end
  end

  describe ".move_piece" do
    it "moves piece from one position to another" do
      x = Chess.new
      x.player_one.color = "white"
      x.board.move_piece("A2,A3", x.player_one)
      expect(x.board.grid[0][2]).to be_a Pawn
      expect(x.board.grid[0][1]).to eql(" ")
    end
  end
end
