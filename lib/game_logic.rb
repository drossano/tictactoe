require_relative "./game_board"
require_relative "./player"

class GameLogic


  def game_loop(player1, player2, board)
    puts board.draw_board
    loop do
      player_turn(player1, board)
      break if check_for_win_or_draw(player1.player_symbol, board) == true

      player_turn(player2, board)
      break if check_for_win_or_draw(player2.player_symbol, board) == true
    end
  end

  def player_turn(player, board)
    p player
    loop do
      space = player.player_input
      if space_empty?(board, space)
        board.game_array[space] = player.player_symbol
        puts board.game_board
        break
      else
        puts "This space is taken, try again."
      end
    end
  end

  def space_empty?(board, space)
    board.game_array[space].is_a?(Numeric)
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
    board.game_array[0..2].all? { |space| space == symbol} || board.game_array[3..5].all? { |space| space == symbol} || board.game_array[6..8].all? { |space| space == symbol}
  end

  def column_win(symbol, board)
    columns = [board.game_array[0], board.game_array[3], board.game_array[6]],[board.game_array[1], board.game_array[4], board.game_array[7]], [board.game_array[2], board.game_array[5], board.game_array[8]]
    columns.any? do |column|
      column.all? { |space| space == symbol}
    end
  end

  def diagonal_win(symbol, board)
    diagonals = [[board.game_array[0], board.game_array[4], board.game_array[8]], [board.game_array[6], board.game_array[4], board.game_array[2]] ]
    diagonals.any? do |diagonal|
      diagonal.all? { |space| space == symbol }
    end
  end

  def draw(board)
    board.flatten.all? { |space| space != " "}
  end
end