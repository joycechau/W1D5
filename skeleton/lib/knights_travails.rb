# require "./00_tree_node"
require_relative "00_tree_node"

class KnightPathFinder

  def self.valid_moves(pos)
    row, col = pos
    [
      [row - 2, col + 1],
      [row - 1, col + 2],
      [row + 1, col + 2],
      [row + 2, col + 1],
      [row + 2, col - 1],
      [row + 1, col - 2],
      [row - 1, col - 2],
      [row - 2, col - 1]
    ].select { |pos| pos.all? { |x| x > 0 && x < 7 } }

  end

  def initialize(start_pos)
    @start_pos = start_pos
    @move_tree = build_move_tree
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos).reject do |position|
      @visited_positions.include?(position)
    end

    @visisted_positions << new_pos
    new_pos
  end

end


if __FILE__ == $PROGRAM_NAME
  p KnightPathFinder.valid_moves([0,0])
  p "------------"
  p KnightPathFinder.valid_moves([3,3])

end
