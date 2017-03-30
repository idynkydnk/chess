require_relative 'player'
require_relative 'board'

class Chess
  attr_accessor :player_one, :player_two, :board, :current_player

  def initialize
    @board = Board.new
    @player_one = Player.new
    @player_two = Player.new
    @current_player = [@player_one, @player_two].sample
  end

  def play
    @board.print_board
    exit
    get_players
    pick_colors
    colors_message
    loop do
      clear_screen
      @board.print_board
      turn_message
      get_move
      switch_players
    end
  end

  def draw_message
    puts "It's a draw!"
    puts
  end

  def clear_screen
    system("clear")
  end

  def winner_message
    puts "#{@current_player.name} is the winner!"
    puts
  end
  
  def turn_message
    puts "#{@current_player.name}: It's your turn"
    puts
  end
  
  def get_move
    puts "Enter your move 1-7:"
    move = gets.chomp
    move = move.to_i
    if check_move(move)
      make_move(move)
    end
    puts
  end

  def check_move(move)
    if move >= 1 && move <= 7 
      return true
    else 
      puts "You can't do that!"
      puts
      get_move
    end
  end

  def make_move(move)
    @board.place_piece(move, @current_player)
  end

  def switch_players
    @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
  end

  def get_players
    print "Enter first players name: "
    @player_one.name = gets.chomp
    print "Enter second players name: "
    @player_two.name = gets.chomp
    puts
  end
  
  def pick_colors
    @player_one.color = ["white", "black"].sample
    @player_one.color == "white" ? @player_two.color = "black" : @player_two.color = "white"
    puts
  end

  def colors_message
    puts "#{@player_one.name}'s color is #{@player_one.color}"
    puts "#{@player_two.name}'s color is #{@player_two.color}"
    puts
  end

end

