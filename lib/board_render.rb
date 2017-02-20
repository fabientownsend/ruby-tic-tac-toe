class BoardRender
  def render(board)
    board.map.with_index do |row, index|
      drawn_row(row) + drawn_inter_row(row, last_row?(board, index))
    end.join
  end

  private

  def last_row?(board, index)
    index != (board.size - 1)
  end

  def drawn_row(row)
    row.map.with_index do |e, index|
      draw_placeholder(e, index == (row.size - 1))
    end.join
  end

  def drawn_inter_row(row, last_row)
    if last_row
      "#{'-' * (row.size * 3 + 2)}\n"
    else
      ""
    end
  end

  def draw_placeholder(e, end_line)
    if end_line
      " #{e || ' '} \n"
    else
      " #{e || ' '} |"
    end
  end
end
