require 'game_interface/interface_io'
require 'players/command_line'
require 'players/computer'

class PlayersFactory
  def initialize
    @interface_io = InterfaceIo.new(Kernel, Kernel)
  end

  def human_vs_human
    [new_human("X"), new_human("O")]
  end

  def human_vs_computer
    [new_human("X"), Computer.new("O")]
  end

  def computer_vs_computer
    [Computer.new("X"), Computer.new("O")]
  end

  private

  def new_human(mark)
    CommandLine.new(mark, @interface_io)
  end
end
