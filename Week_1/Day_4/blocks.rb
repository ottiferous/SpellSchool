class Array

  def my_each &blk
    self.length.times do |num|
      blk.call(self[num])
    end
    self
  end

  def my_map &blk
    arr = []
    self.my_each do |block|
      arr << blk.call(block)
    end
    arr
  end

  def my_select &blk
    arr = []
    self.my_each do |value|
      arr << value if blk.call(value)
    end
    arr
  end

  def my_inject &blk

    total = 0
    self.my_each do |value|
      total = blk.call(total, value)
      p total
    end

    total
  end

  def my_sort! &blk
    change = true

    while change
      change = false
      self.each_index do |index|
        unless index == self.length - 1
          if blk.call(self[index], self[index+1]) == 1
            self[index], self[index+1] = self[index+1], self[index]
            change = true
          end
        end
      end
    end
    self
  end

end
# end of Array class


def eval_block(*args, &blk)
  blk.call(*args)
end