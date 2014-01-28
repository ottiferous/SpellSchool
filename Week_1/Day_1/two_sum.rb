class Array

   def two_sum
      pairs = []
      (0...self.length - 1).each do |first_index|
         (first_index...self.length).each do |last_index|
            if self[first_index] + self[last_index] == 0
               pairs << [first_index, last_index]
            end
         end
      end
      pairs
   end
end