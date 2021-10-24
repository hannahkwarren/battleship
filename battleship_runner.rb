require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/play'
require './lib/turn'

play = Play.new
play.start
play.start_play
play.turn.start_turn
play.turn.player_turn
play.turn.computer_turn
play.turn.show_results
