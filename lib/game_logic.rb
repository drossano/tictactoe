require_relative "./game_board"
require_relative "./player"

class GameLogic
  def initialize
    @board = GameBoard.new
    @player_x = Player.new("X")
    @player_o = Player.new("O")
  end

  def game_loop(player1, player2, board)
    puts @board.draw_board
    loop do
      player_turn(player1, board)
      break if check_for_win_or_draw(player1.player_symbol, board) == true

      player_turn(player2, board)
      break if check_for_win_or_draw(player2.player_symbol, board) == true
    end
  end

  def player_turn(player, board)
    loop do
      space = player.player_input
      if space_empty?(board)
        board[space] = player.player_symbol
        puts board
        break
      else
        puts "This space is taken, try again."
      end
    end
  end

  def space_empty?(board)
    board[space] == " "
  end

  def check_for_win_or_draw(symbol, board)
    if [row_win(symbol, board), column_win(symbol, board), diagonal_win(symbol, board)].any? { |win_condition| win_condition == true }
      puts "Player #{symbol} wins!"
      true
    elsif draw(board)
      puts "Draw!"
      true
    else
      false
    end
  end

  def row_win(symbol, board)
    board.any? do |row|
      row.all? { |space| space == symbol}
    end
  end

  def column_win(symbol, board)
    columns = board.transpose
    columns.any? do |column|
      column.all? { |space| space == symbol}
    end
  end

  def diagonal_win(symbol, board)
    diagonals = [[board[0][0], board[1][1], board[2][2]], [board[2][0], board[1][1], board[0][2]]]
    diagonals.any? do |diagonal|
      diagonal.all? { |space| space == symbol }
    end
  end

  def draw(board)
    board.flatten.all? { |space| space != " "}
  end
end