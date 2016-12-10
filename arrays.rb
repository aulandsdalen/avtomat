def rand_array(size, max_value) # returns array of size populated with random numbers 0..max_value
	size.times.map{ Random.rand(max_value) }
end

def create_2d_array(m, n)
	array = []
	m.times do 
		x = rand_array(n, 100)
		array.push(x)
	end
	return array
end

def swap_first_and_last(array)
	array_last_line = array.size-1
	first_line = array[0]
	last_line = array[array_last_line]
	my_array = array
	my_array[0] = last_line
	my_array[array_last_line] = first_line
	return my_array
end

def reverse_first_and_last(array)
	array_last_line = array.size-1
	my_array = array
	my_array[0].reverse!
	my_array[array_last_line].reverse!
	return my_array
end

def find_index_for_minimum(array)
	height = array.size
	width = array[0].size
	minimums = []
	m = {:row => nil, :col => nil, :minimum => nil}
	height.times do |i|
		minimums.push(array[i].min)
	end
	m[:row] = minimums.find_index(minimums.min) #m_row
	m[:col] = array[m[:row]].find_index(array[m[:row]].min) #m_col
	m[:minimum] = array[m[:row]][m[:col]]
	return m
end

def prettyprint(array)
	array.each do |row|
		row.each do |cell|
			print "#{cell} "
		end
		puts ""
	end
end

#def multiply(arr1, arr2)
#	m1 = arr1.size #rows
#	n1 = arr1[0].size #columns
#	m2 = arr2.size #rows 
#	n2 = arr2[0].size #columns
#	result = Array.new(n1) {Array.new(m2)}
#	raise ArgumentError, "Impossible to multiply these matrices due to that number of columns is not equal to number of rows" unless n1 == m2
#	arr1.each do |row|
#		row.each do |cell|
#end

def convert_content_to_integers(array)
	convertedarray = []
	array.each do |row|
		convertedarray.push(row.map(&:to_i))
	end
	convertedarray
end


def quicksort(array)
	if array.length <= 1 # base case
		return array # array w/ size 0 or 1 is already sorted
	else
		less = Array.new
		equal = Array.new
		greater = Array.new
		pivot = array[array.length/2] # using middle as a pivot
		array.each do |x| 
			if x < pivot
				less.push(x)
			elsif x == pivot
				equal.push(x)
			elsif x > pivot
				greater.push(x)
			end
		end
		# to understand recursion, one must first understand recursion
		less = quicksort(less)
		greater = quicksort(greater)
		return [*less, *equal, *greater]
	end
end