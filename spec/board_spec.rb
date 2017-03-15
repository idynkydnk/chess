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

  describe ".place_piece" do
    it "places a piece on the grid A-H,1-8" do
      board = Board.new
      object = double("object")
      board.place_piece(0, 0, object)
      expect(board.grid[0][0]).to eql(object)
    end
  end
end
