# require "./00_tree_node"
require_relative "00_tree_node"
require 'byebug'

class KnightPathFinder
  attr_reader :move_tree, :visited_positions, :start_pos

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
    ].select { |pos| pos.all? { |x| x.between?(0, 7) } }

  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
    @move_tree = build_move_tree
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos).reject do |position|
      @visited_positions.include?(position)
    end
    new_pos.each { |position| @visited_positions << position }

    new_pos
  end

  def build_move_tree
    root = PolyTreeNode.new(@start_pos)
    tree = []
    queue = [root]

    until queue.empty?
      node = queue.shift
      tree << node
      new_move_positions(node.value).each do |pos|
        child_node = PolyTreeNode.new(pos)
        node.add_child(child_node)
        queue << child_node
      end
    end

    tree
  end

end


if __FILE__ == $PROGRAM_NAME
  knight = KnightPathFinder.new([0,0])
  p knight.move_tree.map {|tree| tree.value}

  # puts knight.visited_positions
  # p knight.start_pos
  # knight.visited_positions.push([2,1])
  # p knight.visited_positions
  # p knight.new_move_positions([0,0])
  # p knight.visited_positions
  # p KnightPathFinder.valid_moves([3,3])

end
