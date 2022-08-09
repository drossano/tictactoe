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
end
