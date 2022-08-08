require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos, :children
  attr_writer :children

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children = []
  end


  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  def possible_board(pos)
    @next_mover_mark == :o ? @next_mover_mark = :x : nil
    duped_board = @board.dup
    duped_board[pos] = @next_mover_mark
    TicTacToeNode.new(duped_board, next_mover_mark, prev_move_pos = nil)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    indices = (0..2).to_a
    positions = indices.product(indices)
    positions.each { |position| @children << possible_board(position) }
  end

end

#children set up with empty array that are all next possible moves
#the new node would be the current board(parents duped) plus next pos move
