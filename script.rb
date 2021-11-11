require_relative "board"
require_relative "player"
require_relative "game"

board = Board.new
game = Game.new
winner = nil

puts "Enter player 1's name"
p1_name = gets.chomp
player_one = Player.new(p1_name) 

puts "Enter player 2's name"
p2_name = gets.chomp
player_two = Player.new(p2_name)

current_player = player_one
until board.cells_filled == 9 || game.winner != "none"
  puts board
  puts "#{current_player.name} Enter a number to fill in a slot"
  num = gets.chomp.to_i

  until board.can_mark?(num, current_player.player_marker)
    puts "#{current_player.name} please enter a valid number to mark the board"
    num = gets.chomp.to_i
  end

  if (game.is_there_a_winner?(board.board, current_player))
    winner = current_player.name
    break;
  end
  current_player == player_one ? current_player = player_two : current_player = player_one
end
puts board

if winner == nil
  puts "Tie Game!"
else
  puts "#{winner} Won!"
end