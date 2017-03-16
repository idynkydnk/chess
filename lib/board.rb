class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { " " }}
  end

  def place_piece(loc, piece)
    @grid[loc[0]][loc[1]] = piece
  end
end
