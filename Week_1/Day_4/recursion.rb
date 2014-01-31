def range(start, finish)

  arr = [start]

  if arr.last != finish
    arr += range( arr.last + 1, finish )
  else
    return arr
  end
end

def sum_range_rec(array, pos=0)

  sum = 0
  sum += array[pos]

  if array[pos] != array[-1]
    sum += sum_range_rec(array, pos+1)
  else
    return sum
  end

end

def iterative_sum(array)

  sum = 0

  array.each do |num|
    sum += num
  end
  sum
end



def exp(num, pow)
  return 1 if pow == 0
  return num if pow == 1
  num * exp(num, pow - 1)

end


def exp2(num, pow)
  return 1 if pow == 0
  return exp2(num, pow/2) ** 2 if pow.even?
  return num * (exp2(num, (pow - 1) / 2) ** 2) if pow.odd?
end

def deep_dup(ar)

  new_array = []

  ar.each do |item|
    if item.is_a?(Array)
      new_array += [deep_dup(item)].dup
    else
      new_array << item
    end
  end

  new_array
end


def fib n

  return [] if n == 0
  return [0] if n <= 1
  return [0,1] if n == 2

  fib(n - 1) << fib(n - 2)[-1] + fib(n - 1)[-1]
end


# Might be useful later - wasnt what we were supposed to do. Ooops.
def bsearch_tree(array, target)
  return target if array == target
  y = nil
  array.each do |x|
    if x.is_a? Array
      y = bsearch_tree(x, target)
    else
      return target if x == target
    end
  end
  y
end

def bsearch(array, target)
  midpoint = array.length / 2
  return nil if target > array.last
  return midpoint if array[midpoint] == target



  if array[midpoint] < target
    return midpoint + bsearch(array[midpoint..-1], target)
  else
    return bsearch(array[0..midpoint-1], target)
  end

  nil
end

def make_change(money, currency = [25, 10, 5, 1])

  return [] if money == 0

  currency.each do |coin|
    if money >= coin
      return [coin] + make_change(money - coin, currency)
    else
      return []
    end

  end
#  arr
end

# # def make_change(money, currency = [25, 10, 5, 1])
# #
# #   return [] if money == 0
# #
# #   currency.length.times do |number|
# #
# #     number.each do |coin|
# #       if money >= coin
# #         return [coin] + make_change(money - coin, number)
# #       else
# #         return []
# #       end
# #
# #     end
# #   end
#
# #  arr
# end

def merge_sort(array)

  return array if array.length <= 1

  middle = array.length / 2
  left = merge_sort(array[0...middle])
  right = merge_sort(array[middle..-1])

  merge_helper(left, right)
end

def merge_helper(array1, array2)
  merged = []

  while !(array1.empty?) || !(array2.empty?)
    if array1.length > 0 && array2.length > 0
      if array1.first <= array2.first
        merged << array1.shift
      else
        merged << array2.shift
      end
    elsif array1.length > 0
      merged << array1.shift
    elsif array2.length > 0
      merged << array2.shift
    end
  end

  merged
end

def subsets(array)

  return [[]] if array.empty?
  return [[], array] if array.length == 1

  the_rest = subsets(array[0..-2])

  new_subsets = subsets(array[0..-2]).map do |inner_array|
    inner_array << array.last
  end

  return the_rest + new_subsets

  # return subsets(array[0..-2]) +
  #   subsets(array[0..-2]).map do |inner_array|
  #     inner_array << array.last
  #   end
  #**********************************************
  # return subsets(array[0..-2]) +
  #        subsets(array[0..-2]).
  #        map do |inner_array|
  #          inner_array << array.last
  #        end
  #**********************************************
  # return subsets(array[0..-2]) + subsets(array[0..-2]).map{ |inner_array| inner_array << array.last }

end