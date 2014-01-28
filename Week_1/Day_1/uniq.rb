class Array
	def my_uniq
		result = []

		self.each do |num|
			if result.include? num
				next
			else result << num
			end
		end
		result
	end
end