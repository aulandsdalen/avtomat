require './arrays.rb'
require 'matrix'

puts "Enter m and n space-separated"
input = gets.chomp.split(" ")
m = input[0].to_i
n = input[1].to_i
raise ArgumentError, "Impossible to create array with given size" unless (m > 0 && n > 0)
puts "Here's #{m}x#{n} array:"
x = create_2d_array(m, n)
prettyprint(x)
puts "Now I'll swap first and last rows for you:"
x = swap_first_and_last(x)
x = reverse_first_and_last(x)
prettyprint(x)
min = find_index_for_minimum(x)
x.each do |row|
	row.delete_at(min[:col])
end
x.delete_at(min[:row])
puts "There was a minimum (#{min[:minimum]}) at intersection of row #{min[:row]} and column #{min[:col]}, so I've deleted them\nNew array is #{m-1}x#{n-1}:"
prettyprint(x)
puts "Enter your own array\nFormatting: space separates elements, comma ends row, all other symbols will be trimmed"
input = gets.chomp.tr('.', '')
rows = input.split(', ')
userarray = []
rows.each do |row|
	userarray.push(row.split(" "))
end
userarray = convert_content_to_integers(userarray)
xm = Matrix[] # that's our matrix
um = Matrix[] # that's user's matrix
rm = Matrix[] # multiplication result
# convert arrays to matrices
x.each do |row|
	xm = Matrix.rows(xm.to_a << row)
end
userarray.each do |row|
	um = Matrix.rows(um.to_a << row)
end
rm = xm * um
puts "And I've multiplied these for you, result is: "
prettyprint(rm.to_a)