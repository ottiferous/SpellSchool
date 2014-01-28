class Array

   def my_each &blk
      self.size.times do |i|
         blk.call(self[i])
      end
      self
   end

   def my_each2

      self.size.times do |i|
         if block_given?
            yield self[i]
         end
      end
      self
   end


end