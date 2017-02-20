require 'interface_io'

RSpec.describe InterfaceIo do
  let(:input) { StringIO.new("world\n") }
  let(:output) { StringIO.new }
  let(:interface_io) { InterfaceIo.new(input, output) }

  it "write a text on the interface" do
    interface_io.write("hello")
    expect(output.string).to eq("hello\n")
  end

  it "get text from the interface" do
    expect(interface_io.read).to eq("world\n")
  end
end
