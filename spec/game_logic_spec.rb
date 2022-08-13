require_relative '../lib/game_logic'
require_relative '../lib/game_board'

describe GameLogic do
  describe '#check_for_win_or_draw' do
    subject(:win_check) { described_class.new }
    context 'when a row wins' do
      it 'returns true' do
        symbol = 'x'
        board = [[], [], []]
        allow(win_check).to receive(:row_win).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol, board)).to eq(true)
      end
    end
    context 'when a column wins' do
      it 'returns true' do
        symbol = 'x'
        board = [[], [], []]
        allow(win_check).to receive(:column_win).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol, board)).to eq(true)
      end
    end
    context 'when a diagonal wins' do
      it 'returns true' do
        symbol = 'x'
        board = [[], [], []]
        allow(win_check).to receive(:diagonal_win).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol, board)).to eq(true)
      end
    end
    context 'when theres a draw' do
      it 'returns true' do
        symbol = 'x'
        board = [[], [], []]
        allow(win_check).to receive(:draw).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol, board)).to eq(true)
      end
    end
    context 'when there isnt a game over condition' do
      it 'returns false' do
        symbol = 'x'
        board = [[], [], []]
        allow(win_check).to receive(:row_win).and_return(false)
        allow(win_check).to receive(:column_win).and_return(false)
        allow(win_check).to receive(:diagonal_win).and_return(false)
        allow(win_check).to receive(:draw).and_return(false)
        expect(win_check.check_for_win_or_draw(symbol, board)).to eq(false)
      end
    end
  end

  describe '#row_win' do
    context 'when theres a win in the top row' do 
      it 'returns true' do
        symbol = "X"
        board = [[symbol, symbol, symbol],
        [" ", " ", " "],
        [" ", " ", " "]]
        expect(subject.row_win(symbol, board)).to eq(true)
      end
    end

    context 'when theres a win in the middle row' do
      it 'returns true' do
        symbol = "X"
        board = [[" ", " ", " "],
        [symbol, symbol, symbol],
        [" ", " ", " "]]
        expect(subject.row_win(symbol, board)).to eq(true)
      end
    end

    context 'when theres a win in the bottom row' do
      it 'returns true' do
        symbol = "X"
        board = [[" ", " ", " "],
        [" ", " ", " "], 
        [symbol, symbol, symbol]]
        expect(subject.row_win(symbol, board)).to eq(true)
      end
    end
  end

  describe '#column_win' do
    context 'where theres a win in the left column' do
      it 'returns true' do
        symbol = "X"
        board = [[symbol, " ", " "],
        [symbol, " ", " "], 
        [symbol, " ", " "]]
        expect(subject.column_win(symbol, board)).to eq(true)
      end
    end

    context 'when theres a win in the middle column' do
      it 'returns true' do
        symbol = "X"
        board = [[" ", symbol, " "],
        [" ", symbol, " "], 
        [" ", symbol, " "]]
        expect(subject.column_win(symbol, board)).to eq(true)
      end
    end

    context 'when theres a win in the right column' do
      it 'returns true' do
        symbol = "X"
        board = [[" ", " ", symbol],
        [" ", " ", symbol], 
        [" ", " ", symbol]]
        expect(subject.column_win(symbol, board)).to eq(true)
      end
    end
  end

  describe '#draw' do
    context 'when theres a draw' do
      it 'returns true' do
        board = [["O", "X", "O"],
        ["X", "X", "O"], 
        ["X", "O", "X"]] 
        expect(subject.draw(board)).to eq(true)
      end
    end
  end

  describe '#game_loop' do
    subject(:game_loop){ described_class.new }
    let(:player1) { instance_double(Player, player_symbol: 'x') }
    let(:player2) { instance_double(Player, player_symbol: 'o')}
    board = [[''], [''], ['']]
    context 'when player1 wins' do
      before do
        allow(game_loop).to receive(:player_turn).with(player1, board)
        allow(game_loop).to receive(:check_for_win_or_draw).with(player1.player_symbol, board).and_return(true)
      end
      it 'stops loop and doesnt start player2s turn' do
        expect(game_loop).not_to receive(:player_turn).with(player2, board)
      end
    end

    context 'when player2 wins' do
      before do
        allow(game_loop).to receive(:player_turn).with(player1, board)
        allow(game_loop).to receive(:check_for_win_or_draw).with(player1.player_symbol, board).and_return(true)
        allow(game_loop).to receive(:player_turn).with(player2, board)
      end
      it 'stops the loop and doesnt start player1s turn' do
        expect(game_loop).not_to receive(:player_turn).with(player1, board)
      end
    end
  end

  describe '#player_turn' do
    subject(:game_turn) { described_class.new }
    let(:player) {instance_double(Player, player_symbol: 'x') }

    context 'when a free space is entered' do
      before do
        empty_space = 1
        allow(player).to receive(:player_input).and_return(empty_space)
        allow(game_turn).to receive(:space_empty?).and_return(true)
      end
      it ' returnts the board and ends the loop' do
        board = [['', '', ''], ['', '', ''], ['', '', '']]
        error_message = "This space is taken, try again."
        expect(game_turn).not_to receive(:puts).with(error_message)
        #game_turn.player_turn(player, board)
      end
    end
    context 'a taken space is entered once' do
      before do
        allow(player).to receive(:player_input).and_return(1)
        allow(game_turn).to receive(:space_empty?).and_return(false,true)
      end
      it 'displays the error message once' do
        board = [['', '', ''], ['', '', ''], ['', '', '']]
        error_message = "This space is taken, try again."
        expect(game_turn).to receive(:puts).with(error_message).once
        expect(game_turn).not_to receive(:puts).with(error_message)
        game_turn.player_turn(player, board)
      end
    end
  end

  describe '#space_empty?' do
    subject(:game_space) { described_class.new }
    context 'when the space is empty' do
      it 'returns true' do
        board = [1, " "]
        empty_space = 1
        expect(game_space.space_empty?(board, empty_space)).to eq(true)
      end
    end

    context 'when the space is not empty' do
      it 'returns false' do
        board = [1, " "]
        taken_space = 0
        expect(game_space.space_empty?(board, taken_space)).to eq(false)
      end
    end
  end
end
