require 'byebug'
class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(other)
    @parent.children.delete(self) if @parent
    # byebug
    # other.add_child(self) unless other.nil?
    other.children.push(self) unless (other.nil? || other.children.include?(self))
    @parent = other
  end

  def add_child(child)
    @children << child unless @children.include?(child)
    child.parent = self
  end

  def remove_child(child)
    raise "You don't have that child" unless @children.include?(child)
    @children.delete(child)
    child.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    @children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      current_node.children.each do |child|
        # return child if child.value == target
        queue << child
      end
    end
    nil
  end
end
