require 'game_play/board'

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

  def minimax(board, depth = 9, computer = false, alpha = -100, beta = 100)
    return -depth if board.win?(opponent_mark)
    return depth if board.win?(mark)
    return 0 if board.tie?

    if computer
      maximizing_player(board, depth, alpha, beta)
    else
      minimizing_player(board, depth, alpha, beta)
    end
  end

  def maximizing_player(board, depth, alpha, beta)
    best_value = -100

    board.placeholder_available.each do |position|
      board.set_mark(mark, position)
      value = minimax(board, depth - 1, false, alpha, beta)
      board.set_mark(nil, position)

      best_value = [best_value, value].max
      alpha = [alpha, best_value].max
      break if alpha >= beta
    end

    best_value
  end

  def minimizing_player(board, depth, alpha, beta)
    best_value = 100

    board.placeholder_available.each do |position|
      board.set_mark(opponent_mark, position)
      value = minimax(board, depth - 1, true, alpha, beta)
      board.set_mark(nil, position)

      best_value = [best_value, value].min
      beta = [beta, best_value].min
      break if alpha >= beta
    end

    best_value
  end

  def opponent_mark
    mark == "X" ? "O" : "X"
  end
end
