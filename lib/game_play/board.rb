class Board
  def initialize(size = 3)
    @board = Array.new(size) { Array.new(size) }
    @marks = %w(X O)
  end

  def current
    @board
  end

  def set_mark(mark, position)
    @board[row(position)][column(position)] = mark
  end

  def available?(position)
    @board[row(position)][column(position)].nil?
  end

  def win?(mark)
    (rows + columns + diagonals).any? { |row| same_value?(row, mark) }
  end

  def tie?
    @board.flatten.none?(&:nil?) && @marks.none? { |mark| win?(mark) }
  end

  def over?
    tie? || @marks.any? { |mark| win?(mark) }
  end

  def placeholder_available
    @board.flatten.map.with_index { |spot, index| index if spot.nil? }.compact
  end

  private

  def same_value?(row, mark)
    row.all? { |placeholder| placeholder == mark }
  end

  def row(position)
    position / @board.size
  end

  def column(position)
    position % @board.size
  end

  def rows
    @board
  end

  def columns
    @board.transpose
  end

  def diagonals
    [first_diagonal, second_diagonal]
  end

  def first_diagonal
    (0..@board.size - 1).map { |i| @board[i][i] }
  end

  def second_diagonal
    (0..@board.size - 1).map { |i| @board[i][(@board.size - 1 - i)] }
  end
end
