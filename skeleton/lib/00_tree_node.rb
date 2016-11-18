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
    # byebug
    @children << child unless @children.include?(child)
    child.parent = self
  end
end
