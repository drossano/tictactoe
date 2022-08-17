require_relative "./lib/game_logic"
require_relative "./lib/game_board"
require_relative "./lib/player"


board = GameBoard.new
player_x = Player.new("X")
player_o = Player.new("O")

game = GameLogic.new
game.game_loop(player_x, player_o, board)
