module Enumerable
	def my_each
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		counter = 0

		for i in self
			yield(i), counter
			counter += 1
		end
	end

	def my_select
		value = []

		for i in self
			result << i if yield(i)
		end

		return result
	end

	def my_all?
		self.my_select { |i| yield(i) } == self ? true : false
	end

	def my_any?
		self.my_select { |i| yield(i) }.size > 0 ? true : false
	end

	def my_none?
		!my_any? { |i| yield(i) }
	end

	def my_count
		counter = 0

		self.my_each { |i| counter += i if yield(i)}

		return counter
	end

	def my_map(&my_proc)
		array = []

		if block_given?
			self.my_each { |i| array.push(my_proc.call(i)) }
			return array
		end
	end

	def my_inject(num = nil)
    	accumulator = num.nil? ? first : num
    	my_each { |i| accumulator = yield(accumulator, i) }
    	accumulator
 	end

end


def multiply_els(list)
  list.my_inject(1) { |product, i| product * i }
end



