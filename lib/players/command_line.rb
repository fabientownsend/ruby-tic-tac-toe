class CommandLine
  attr_reader :mark

  def initialize(mark, io)
    @mark = mark
    @io = io
  end

  def next_move(_board)
    Integer(@io.read)
  end
end
