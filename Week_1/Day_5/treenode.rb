class TreeNode
  
  attr_accessor :parent, :children, :value
  
  def initialize
    @parent
    @children = []
    @value
  end
  
  def inspect
    puts "-Parent Node: <#{@parent}>"
    puts "-Children: #{@children.count}"
    puts "-Value: #{@value}"
  end
  
  def remove_child(child_node)

    child_node.parent = nil
    @children.delete child_node

  end
  
  def add_child(child_node)
    
    child_node.remove_child(child_node)
    child_node.parent = self
    @children << child_node
    
  end

  # helper method for running searches within nodes
  def search(target_value, options = {})

    defaults = {
      :method => :dfs
    }

    options = defaults.merge(options)

    case options[:method]
    when :dfs
      result = self.dfs(target_value)
    when :bfs
      result = self.bfs(target_value)
    end

    return (result == target_value ? target_value : false)
  end

  def dfs(target_value)

     puts "At node #{@value}"
     return target_value if @value == target_value
     y = nil
     
     @children.each do |child_node|
        y = child_node.dfs(target_value)
        return target_value if y == target_value
     end
     y
  end
  
  # Breadth-first search (not recursive)
  def bfs(target_value)
    
    queue = []
    queue << self
    
    while queue.empty? == false
      
      # Displays the status of queue to make sure search is happening correctly
      # seems to be correct so far
      puts "The Queue is #{queue.map { |x| x.value}}"
      

      check = queue.pop
      
      puts "AT NODE: #{check.value}"
      if check.value == target_value
        return [check.class, check.value]
      else
        # move children to end of queue
        queue.unshift(*check.children)
      end
    end
    
    # failed to find value - return false
    false
  end
  
  # /TreeNode
end

# Sample data to test search

A = TreeNode.new
A.value = "ROOT"
b = TreeNode.new
b.value = "cat"
c = TreeNode.new
c.value = "dog"
d = TreeNode.new
d.value = "parrot"
e = TreeNode.new
e.value = "marmots"
f = TreeNode.new
f.value = "fish"
g = TreeNode.new
g.value = "mantis shrimp"
h = TreeNode.new
h.value = "snake"

A.add_child b                         # cat
A.add_child c                         # dog
A.children[0].add_child d             # parrot
A.children[0].children[0].add_child e # marmots
A.children[1].add_child f             # fish
A.children[1].add_child g             # mantis shrimp
A.children[1].children[1].add_child h # snake