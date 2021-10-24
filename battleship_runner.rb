require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/play'
require './lib/turn'

play = Play.new

response = play.start

if response == "p"
  play.start_play
  play.turn.play_process
  play.turn.player_turn
  play.turn.computer_turn
  play.turn.show_results
end
