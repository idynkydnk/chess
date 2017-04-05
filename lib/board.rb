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

  def move_piece(move, player)
    start_x = move[0].ord - 65
    start_y = move[1].to_i - 1
    end_loc = [move[3].ord - 65, move[4].to_i - 1]
    if @grid[start_x][start_y].color == player.color &&
        @grid[start_x][start_y].possible_moves.include?(end_loc)
      @grid[end_loc[0]][end_loc[1]] = @grid[start_x][start_y]
      @grid[start_x][start_y] = " "
    end

#    start_loc = move first two
#    end_loc = move last two
#    if grid[start_loc].color == player.color
#      if end_loc is in grid[start_loc].possible_locations
#    end 
  end

  def place_piece(loc, piece)
    @grid[loc[0]][loc[1]] = piece
  end

  def print_board
    row_color = "black"
    print_letters
    7.downto(0) do |row|
      print "  "
      row_color == "black" ? print_black_row : print_white_row
      print (row + 1).to_s + " "
      row_color == "black" ? center_black_row(row) : center_white_row(row)
      puts " " + (row + 1).to_s
      print "  "
      row_color == "black" ? print_black_row : print_white_row
      row_color == "black" ? row_color = "white" : row_color = "black"
    end
    print_letters
  end

  private

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

  def print_letters
    letters = ('A'..'H').to_a
    print "  "
    8.times do
      print "   " + letters.shift + "   "
    end
    puts
  end

  def center_black_row(row)
    col = 0
    4.times do
      print " ".bg_black * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon.bg_black
      else
        print "  ".bg_black
      end
      print " ".bg_black * 2
      col += 1
      print " ".bg_white * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon.bg_white
      else
        print "  ".bg_white
      end
      print " ".bg_white * 2
      col += 1
    end
  end

  def center_white_row(row)
    col = 0
    4.times do
      print " ".bg_white * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon.bg_white
      else
        print "  ".bg_white
      end
      print " ".bg_white * 2
      col += 1
      print " ".bg_black * 3
      if @grid[col][row] != " "  
        print @grid[col][row].icon.bg_black
      else
        print "  ".bg_black
      end
      print " ".bg_black * 2
      col += 1
    end
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
