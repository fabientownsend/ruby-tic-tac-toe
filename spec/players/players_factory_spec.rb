require 'players/players_factory'

RSpec.describe PlayersFactory do
  let(:players_factory) { PlayersFactory.new }

  it "returns two command line players" do
    players = players_factory.human_vs_human

    expect(players.first).to be_a(CommandLine)
    expect(players.last).to be_a(CommandLine)
  end

  it "returns two human players with different mark" do
    players = players_factory.human_vs_human

    expect(players.first.mark).to eq("X")
    expect(players.last.mark).to eq("O")
  end

  it "returns two computer players" do
    players = players_factory.computer_vs_computer

    expect(players.first).to be_a(Computer)
    expect(players.last).to be_a(Computer)
  end

  it "returns two computer player with different mark" do
    players = players_factory.computer_vs_computer

    expect(players.first.mark).to eq("X")
    expect(players.last.mark).to eq("O")
  end

  it "returns a console line and computer player" do
    players = players_factory.human_vs_computer

    expect(players.first).to be_a(CommandLine)
    expect(players.last).to be_a(Computer)
  end

  it "returns two players with different mark" do
    players = players_factory.human_vs_computer

    expect(players.first.mark).to eq("X")
    expect(players.last.mark).to eq("O")
  end
end
