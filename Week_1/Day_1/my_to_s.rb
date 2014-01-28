def num_to_s (num, base)

   base_lookup    = {
      0           => "0",
      1           => "1",
      2           => "2",
      3           => "3",
      4           => "4",
      5           => "5",
      6           => "6",
      7           => "7",
      8           => "8",
      9           => "9",
      10          => "A",
      11          => "B",
      12          => "C",
      13          => "D",
      14          => "E",
      15          => "F"
   }

   pow           = 0
   result_string = ""
   until (num / (base**pow)) == 0

      x = num/ (base**pow) % base

      result_string.insert(0, base_lookup[x])

      pow += 1
   end
   result_string
end


