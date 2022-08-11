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
end
