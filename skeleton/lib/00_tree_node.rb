class PolyTreeNode
  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(other)
    if @parent
      @parent.children.delete(self)
    end
    other.children.push(self) unless (other.nil?)
    @parent = other
  end
end
