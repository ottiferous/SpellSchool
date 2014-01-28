# hash offset

def fix_my_hash wrong_hash

   right_hash = {}

   wrong_hash.each do | key, value |
      right_hash[value[0].to_sym] = value
   end

   right_hash

end