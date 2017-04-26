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

  describe ".check?" do

    it "should return false when not in check" do
      x = Chess.new
      player = x.player_one
      player.color = "white"
      expect(x.board.check?(player)).to be(false)
    end 

    it "should return true when in check" do
      x = Chess.new
      player = x.player_one
      player.color = "black"
      piece = Queen.new("white", [0,0])
      x.board.place_piece([4,6], piece)
      piece.position = [4,6]
      expect(x.board.check?(player)).to be(true)
    end 

    it "should return true when in check" do
      x = Chess.new
      x.player_one.color = "white"
      x.player_two.color = "black"
      x.board.move_piece("A2,A4", x.player_one)
      x.board.move_piece("A1,A3", x.player_one)
      x.board.move_piece("A3,E3", x.player_one)
      x.board.move_piece("E7,E5", x.player_two)
      x.board.move_piece("E3,E5", x.player_one)
      expect(x.board.check?(x.player_two)).to be(true)
    end 

    it "should return true when in check after the king moves around" do
      x = Chess.new
      x.player_one.color = "white"
      x.player_two.color = "black"
      x.board.move_piece("E2,E4", x.player_one)
      x.board.move_piece("E1,E2", x.player_one)
      x.board.move_piece("E2,E3", x.player_one)
      x.board.move_piece("E3,F3", x.player_one)
      x.board.move_piece("D7,D6", x.player_two)
      x.board.move_piece("F3,G3", x.player_one)
      x.board.move_piece("G3,H3", x.player_one)
      expect(x.board.check?(x.player_one)).to be(true)
    end 

  end
end
