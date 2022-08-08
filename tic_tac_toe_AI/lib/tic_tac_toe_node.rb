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
    duped_board = @board.dup
    duped_board[r,c] = next_mover_mark
    TicTacToeNode.new(duped_board, next_mover_mark, prev_move_pos = nil)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    @board.dup.each.with_index do |row, r|
      row.each.with_index do |el , c|
        children << possible_board([r,c]) if !self.empty?([r,c])
      end
    end
  end
end

#children set up with empty array that are all next possible moves
#the new node would be the current board(parents duped) plus next pos move
