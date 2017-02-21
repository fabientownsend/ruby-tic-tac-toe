require 'computer'
require 'board'

RSpec.describe Computer do
  let(:board) { Board.new }
  let(:computer) { Computer.new("O") }

  it "returns the mark of the player" do
    expect(computer.mark).to eq("O")
  end

  it "returns positin where computer could win" do
    string_to_board(
      "O|O| |"\
      " | | |"\
      " | | |"
    )

    expect(computer.next_move(board)).to eq(2)
  end

  it "return position that will block opponent" do
    string_to_board(
      "X|X|O|"\
      " |O| |"\
      "X|O|X|"
    )

    expect(computer.next_move(board)).to eq(3)
  end

  it "returns position 6" do
    string_to_board(
      "X|X|O|"\
      " |O|X|"\
      " | | |"
    )

    expect(computer.next_move(board)).to eq(6)
  end

  it "returns position 8" do
    string_to_board(
      "X|X|O|"\
      " |X|O|"\
      " | | |"
    )

    expect(computer.next_move(board)).to eq(8)
  end

  it "returns position 5" do
    string_to_board(
      "X|X|O|"\
      "O|O| |"\
      " | | |"
    )

    expect(computer.next_move(board)).to eq(5)
  end

  it "returns position 6" do
    string_to_board(
      "X|O| |"\
      "X| |O|"\
      " | | |"
    )

    expect(computer.next_move(board)).to eq(6)
  end

  it "returns position 6" do
    string_to_board(
      "X| | |"\
      " | | |"\
      " | |X|"
    )

    expect(computer.next_move(board)).to eq(4)
  end

  it "block vs win" do
    string_to_board(
      "X|X| |"\
      "O|O| |"\
      " | | |"
    )

    expect(computer.next_move(board)).to eq(5)
  end

  private

  def string_to_board(string_board)
    positions = string_board.split("|")
    positions.each_with_index do |e, index|
      board.set_mark(e, index) if e != " "
    end
  end
end
