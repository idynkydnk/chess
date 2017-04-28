require_relative 'lib/chess'

system("clear")
puts "1. New Game"
puts "2. Load Game"
puts "3. Delete Game"
choice = gets.chomp
case choice
when "1"
  game = Chess.new
  game.play
when "2"
  puts Dir.entries("games")
  puts "Which game would you like to load? Just enter the number, or \"c\" to cancel."
  game_number = gets.chomp
  exit if game_number == "c"
  stored_state = YAML.load(File.read("../games/game#{game_number}"))
  game = Game.new
  game.load_saved_game(stored_state, game_number)
when "3"
  puts Dir.entries("games")
  puts "Which game would you like to delete? Just enter the number, or \"c\" to cancel."
  game_number = gets.chomp
  exit if game_number == "c"
  File.delete("../games/game#{game_number}")
end

