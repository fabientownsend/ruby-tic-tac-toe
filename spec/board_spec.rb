require 'board'

RSpec.describe Board do
  let(:board) { Board.new }

  it "returns an initial board" do
    expect(quick_board_render(board.current)).to eq(
      " | | |"\
      " | | |"\
      " | | |"
    )
  end

  it "sets marks on the board" do
    board.set_mark("X", 0)
    board.set_mark("O", 1)

    expect(quick_board_render(board.current)).to eq(
      "X|O| |"\
      " | | |"\
      " | | |"
    )
  end

  it "updates a placeholder with last mark" do
    board.set_mark("X", 0)
    board.set_mark("O", 0)

    expect(quick_board_render(board.current)).to eq(
      "O| | |"\
      " | | |"\
      " | | |"
    )
  end

  it "returns true if a placeholder is available" do
    expect(board.available?(0)).to be(true)
  end

  it "returns false if a placeholder isn't available" do
    board.set_mark("X", 0)

    expect(board.available?(0)).to be(false)
  end

  it "returns false when a mark doesn't win" do
    expect(board.win?("X")).to be(false)
  end

  it "returns true when first row wins" do
    string_to_board(
      "X|X|X|"\
      " | | |"\
      " | | |"
    )

    expect(board.win?("X")).to be(true)
  end

  it "returns true when second row wins" do
    string_to_board(
      " | | |"\
      "X|X|X|"\
      " | | |"
    )

    expect(board.win?("X")).to be(true)
  end

  it "returns true when third row wins" do
    string_to_board(
      " | | |"\
      " | | |"\
      "X|X|X|"
    )

    expect(board.win?("X")).to be(true)
  end

  it "returns true when first column wins" do
    string_to_board(
      "X| | |"\
      "X| | |"\
      "X| | |"
    )
  end

  it "returns true when second column wins" do
    string_to_board(
      " |X| |"\
      " |X| |"\
      " |X| |"
    )

    expect(board.win?("X")).to be(true)
  end

  it "returns true when third column wins" do
    string_to_board(
      " |X| |"\
      " |X| |"\
      " |X| |"
    )

    expect(board.win?("X")).to be(true)
  end

  it "returns true when first diagonal wins" do
    string_to_board(
      "X| | |"\
      " |X| |"\
      " | |X|"
    )

    expect(board.win?("X")).to be(true)
  end

  it "returns true when second diagonal wins" do
    string_to_board(
      " | |X|"\
      " |X| |"\
      "X| | |"
    )

    expect(board.win?("X")).to be(true)
  end

  it "returns true when it's a tie" do
    string_to_board(
      "O|O|X|"\
      "X|X|O|"\
      "O|X|O|"
    )

    expect(board.tie?).to be(true)
  end

  it "returns false when the board isn't full" do
    string_to_board(
      "O|O|X|"\
      "X|X| |"\
      "O|X|O|"
    )

    expect(board.tie?).to be(false)
  end

  it "returns true if someone wins" do
    string_to_board(
      "O|O|X|"\
      "X|X|X|"\
      "O|X|O|"
    )

    expect(board.tie?).to be(false)
  end

  it "returns the placeholders available" do
    string_to_board(
      "O|O| |"\
      "X| |X|"\
      "O|X| |"
    )

    expect(board.placeholder_available).to eq([2, 4, 8])
  end

  private

  def string_to_board(string_board)
    positions = string_board.split("|")
    positions.each_with_index do |e, index|
      board.set_mark(e, index) if e != " "
    end
  end

  def quick_board_render(arr_board)
    arr_board.flatten.map { |e| "#{e || ' '}|" }.join
  end
end
