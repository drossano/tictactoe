require_relative "./game_board"
require_relative "./player"

class GameLogic
  def initialize
    @board = GameBoard.new
    @player_x = Player.new("X")
    @player_o = Player.new("O")
  end

  def game_loop
    puts @board.draw_board
    loop do
      player_turn(@player_x)
      break if check_for_win_or_draw(@player_x.player_symbol) == true

      player_turn(@player_o)
      break if check_for_win_or_draw(@player_o.player_symbol) == true

    end
  end

  def player_turn(player)
    loop do
      column = player.player_input("column")
      row = player.player_input("row")
      if @board.game_array[row][column] == " "
        @board.game_array[row][column] = player.player_symbol
        puts @board.draw_board
        break
      else
        puts "This space is taken, try again."
      end
    end
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