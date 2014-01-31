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

   # Depth-first search (recursive)
   def dfs(target_value)
      return target_value if @value == target_value
      result = nil
     
      @children.each do |child_node|
         result = child_node.dfs(target_value)
         return target_value if result == target_value
      end
      result
   end

   # Breadth-first search (not recursive)
   def bfs(target_value)
      queue = []
      queue << self

      while queue.empty? == false
         check = queue.pop
      
         if check.value == target_value
            return check.value
         else
            queue.unshift(*check.children)
         end
      end
    
      false
   end

   # /TreeNode
end
