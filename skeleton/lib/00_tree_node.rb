require 'byebug'
class PolyTreeNode
  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(other)
    @parent.children.delete(self) if @parent
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
  end
end
