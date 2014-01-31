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

def iterative_sum array

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

def deep_dup array

  new_array = []

  array.each do |item|
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
def bsearch_tree(node, target)
  return target if node == target
  y = nil
  node.each do |x|
    if x.is_a? node.class
      y = bsearch_tree(x, target)
    else
      return target if x == target
    end
  end
  y
end

def binary_search(array, target)
  midpoint = array.length / 2
  return nil if target > array.last
  return midpoint if array[midpoint] == target

  if array[midpoint] < target
    return midpoint + binary_search(array[midpoint..-1], target)
  else
    return binary_search(array[0..midpoint-1], target)
  end

  nil
end

def make_change(money, currency = [25, 10, 5, 1])

  return [] if money == 0
  
  currency.each do |coin|
    if money >= coin
      return [coin] + make_change(money - coin, currency)
    end
  end

end

def merge_sort(array)

  return array if array.length <= 1

  middle = array.length / 2
  
  left = merge_sort(array[0...middle])
  right = merge_sort(array[middle..-1])

  merge_helper(left, right)
end

def merge_helper(left, right)
  merged = []

  while !(left.empty?) || !(right.empty?)
    if left.length > 0 && right.length > 0
      if left.first <= right.first
        merged << left.shift
      else
        merged << right.shift
      end
    elsif left.length > 0
      merged << left.shift
    elsif right.length > 0
      merged << right.shift
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