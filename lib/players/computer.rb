class Computer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def next_move(board)
    best_move, best_position = -100

    board.placeholder_available.each do |position|
      value_move = evaluate_move(board, position)

      if value_move > best_move
        best_position = position
        best_move = value_move
      end
    end

    best_position
  end

  private

  def evaluate_move(board, position)
    board.set_mark(mark, position)
    value_move = minimax(board)
    board.set_mark(nil, position)
    value_move
  end

  def minimax(board, depth = 9, computer = false)
    return -depth if board.win?("X")
    return depth if board.win?(mark)
    return 0 if board.tie?

    if computer
      maximizing_player(board, depth)
    else
      minimizing_player(board, depth)
    end
  end

  def maximizing_player(board, depth)
    best_value = -100

    board.placeholder_available.each do |position|
      board.set_mark("O", position)
      value = minimax(board, depth - 1, false)
      best_value = [best_value, value].max
      board.set_mark(nil, position)
    end

    best_value
  end

  def minimizing_player(board, depth)
    best_value = 100

    board.placeholder_available.each do |position|
      board.set_mark("X", position)
      value = minimax(board, depth - 1, true)
      best_value = [best_value, value].min
      board.set_mark(nil, position)
    end

    best_value
  end
end
