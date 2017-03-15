class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { " " }}
  end

  def place_piece(col, row, piece)
    @grid[col][row] = piece
  end
end
