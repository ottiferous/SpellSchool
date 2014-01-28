#In Words example 15 with TestFirstRuby

class Fixnum

   def in_words


      return'zero' if self == 0 # special case, and breaks the pattern otherwise.

      ones       = { 1 =>'one', 2 =>'two', 3 =>'three', 4 =>'four', 5 =>'five', 6 =>'six', 7 =>'seven', 8 =>'eight', 9 =>'nine' }
      teens      = { 0 =>'ten', 1 =>'eleven', 2 =>'twelve', 3 =>'thirteen', 4 =>'fourteen', 5 =>'fifteen', 6 =>'sixteen', 7 =>'seventeen', 8 =>'eighteen', 9 =>'nineteen' }
      tens       = { 2 =>'twenty', 3 =>'thirty', 4 =>'forty', 5 =>'fifty', 6 =>'sixty', 7 =>'seventy', 8 =>'eighty', 9 =>'ninety' }
      hundreds   = { 0 => 'hundred', 1 =>'thousand', 2 =>'million', 3 =>'billion', 4 =>'trillion' }

      #In order to ensure that our trios of numbers get added in the order of largest-->smallest
      num_array  = self.to_s.split('')

      num_array.each_with_index { |num,index| num_array[index] = num.to_i}
      num_array.reverse!

      word_array = []
      powers     = 0
      until num_array.empty? do

         trio    = num_array.pop(3)
         p trio

         word_array << ones[trio[2]]

         if trio[1] > 1
            word_array << tens[trio[1]] << ones[trio[0]]
         else
            word_array << teens[trio[1]] << ones[trio[0]]
         end

         if word_array.first > 0
            word_array.insert(1, hundreds[powers])
         end

         powers += 1
      end


      word_array.join(" ")

   end
end
