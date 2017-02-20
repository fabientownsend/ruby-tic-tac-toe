require "board_render"

RSpec.describe BoardRender do
  it "render an empty board" do
    board_render = BoardRender.new
    board = Array.new(3) { Array.new(3) }
    expect(board_render.render(board)).to eq("   |   |   \n" \
                                             "-----------\n" \
                                             "   |   |   \n" \
                                             "-----------\n" \
                                             "   |   |   \n")
  end

  it "render a board with an element" do
    board_render = BoardRender.new
    board = Array.new(3) { Array.new(3) }
    board[0][0] = "X"
    expect(board_render.render(board)).to eq(" X |   |   \n" \
                                             "-----------\n" \
                                             "   |   |   \n" \
                                             "-----------\n" \
                                             "   |   |   \n")
  end
end
