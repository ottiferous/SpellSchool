def set_add_el(set, key)

   set[key] = true

end

def set_remove_el(set, key)

   set.delete(key)
   set

end

def set_list_els(set)

   set.keys

end

def set_member?(set, key)

   set.has_key?(key)

end


def set_union(set_1, set_2)
   set_1.merge(set_2)
end

def set_intersection(set_1, set_2)

   set_1.keep_if { |key, value| set_2.has_key? key }

end

def set_minus(set_1, set_2)

   set_1.reject { |key,value| set_2.has_key? key }

end