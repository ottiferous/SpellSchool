def my_transpose source_matrix

   row_length = source_matrix[0].length
   matrix     = source_matrix.flatten

   result = []
   packet = []

   (0...row_length).each do |pos|
      packet = []
      (0...row_length).each do |i|
         packet << matrix[pos + (row_length*i)]
      end
      result << packet
   end

   result
end
