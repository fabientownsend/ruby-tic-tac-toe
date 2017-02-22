require 'game_interface/interface_io'
require 'players/command_line'

RSpec.describe CommandLine do
  let(:input) { StringIO.new("0") }
  let(:output) { StringIO.new }
  let(:io) { InterfaceIo.new(input, output) }
  let(:player) { CommandLine.new("X", io) }

  it "retuns the player's next move" do
    board = nil
    expect(player.next_move(board)).to eq(0)
  end

  it "returns the player's mark" do
    expect(player.mark).to eq("X")
  end
end
