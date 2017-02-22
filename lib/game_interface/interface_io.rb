class InterfaceIo
  def initialize(input, output)
    @input = input
    @output = output
  end

  def write(text)
    @output.puts text
  end

  def read
    @input.gets
  end
end
