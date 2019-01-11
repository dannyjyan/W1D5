class PolyTreeNode
  attr_reader :parent, :children, :value
  def initialize(value)
    @value = value 
    @children = []
    @parent = nil 
  end 

  def parent=(node)
    @parent.children.delete(self) if parent != nil
    @parent = node
    parent.children << self if node && !parent.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Child not found" if !self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
      curr_node = child.dfs(target) 
      return curr_node if curr_node
    end
    nil
  end

  # def dfs_iter(target)
  #   stack = [self]
  #   until stack.empty?
  #     curr_node = stack.pop
  #     p curr_node
  #     if curr_node.value == target
  #       return curr_node
  #     end
  #     curr_node.children.reverse.each { |child| stack.push(child)}
  #   end
  # end  

  def bfs(target)
    queue = [self]
    until queue.empty? 
      curr_node = queue.shift 
      p curr_node
      if curr_node.value == target 
        return curr_node
      end 
      curr_node.children.each {|child| queue.push(child)}
    end 
  end 

  def inspect
    "#{value}"
  end
end

# a = PolyTreeNode.new('a')
# b = PolyTreeNode.new('b')
# c = PolyTreeNode.new('c')
# d = PolyTreeNode.new('d')
# e = PolyTreeNode.new('e')
# f = PolyTreeNode.new('f')
# g = PolyTreeNode.new('g')

# d.parent = b 
# e.parent = b 
# f.parent = c
# g.parent = c
# b.parent = a 
# c.parent = a

# a.dfs('g')