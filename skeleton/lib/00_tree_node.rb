class PolyTreeNode
  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(other)
    other.children.push(self) unless (other.nil? || other.children.include?(self) )
    @parent = other
  end
end
