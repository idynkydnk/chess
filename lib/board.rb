require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'rook'
require_relative 'string'


class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { " " }}
    set_default_board
  end

  def set_default_board
    set_white_pieces
    set_black_pieces
  end

  def set_white_pieces
    place_piece([0,0], Rook.new("white", [0,0]))
    place_piece([1,0], Knight.new("white", [1,0]))
    place_piece([2,0], Bishop.new("white", [2,0]))
    place_piece([3,0], Queen.new("white", [3,0]))
    place_piece([4,0], King.new("white", [4,0]))
    place_piece([5,0], Bishop.new("white", [5,0]))
    place_piece([6,0], Knight.new("white", [6,0]))
    place_piece([7,0], Rook.new("white", [7,0]))
    8.times do |x|
      place_piece([x,1], Pawn.new("white", [x,1]))
    end
  end
 
  def set_black_pieces
    place_piece([0,7], Rook.new("black", [0,7]))
    place_piece([1,7], Knight.new("black", [1,7]))
    place_piece([2,7], Bishop.new("black", [2,7]))
    place_piece([3,7], Queen.new("black", [3,7]))
    place_piece([4,7], King.new("black", [4,7]))
    place_piece([5,7], Bishop.new("black", [5,7]))
    place_piece([6,7], Knight.new("black", [6,7]))
    place_piece([7,7], Rook.new("black", [7,7]))
    8.times do |x|
      place_piece([x,6], Pawn.new("black", [x,6]))
    end
  end

  def place_piece(loc, piece)
    @grid[loc[0]][loc[1]] = piece
  end

  def print_board
    row_color = "black"
    7.downto(0) do |row|
      row_color == "black" ? print_black_row : print_white_row
      row_color == "black" ? center_black_row(row) : center_white_row(row)
      row_color == "black" ? print_black_row : print_white_row
      row_color == "black" ? row_color = "white" : row_color = "black"
    end
  end

  private

  def center_black_row(row)
    col = 0
    4.times do
      print " ".bg_black * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon 
      else
        print "  ".bg_black
      end
      print " ".bg_black * 2
      col += 1
      print " ".bg_white * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon 
      else
        print "  ".bg_white
      end
      print " ".bg_white * 2
      col += 1
    end
    puts
  end

 
  def center_white_row(row)
    col = 0
    4.times do
      print " ".bg_white * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon 
      else
        print "  ".bg_white
      end
      print " ".bg_white * 2
      col += 1
      print " ".bg_black * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon 
      else
        print "  ".bg_black
      end
      print " ".bg_black * 2
      col += 1
    end
    puts
  end

  def print_black_row
    4.times do
      print " ".bg_black * 7
      print " ".bg_white * 7
    end
    puts
  end

  def print_white_row
    4.times do
      print " ".bg_white * 7
      print " ".bg_black * 7
    end
    puts
  end
end
