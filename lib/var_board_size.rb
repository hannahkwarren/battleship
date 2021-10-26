require_relative "cell"
require_relative "ship"

@cells = {}
@letters = {}


puts "Please enter the number of rows you want:"
rows = Integer(gets)

puts "Please enter the number of columns you want:"
columns = Integer(gets)


total_cells = rows * columns
puts total_cells


alphabet = ("A".."Z").to_a
numbers = ("1".."26").to_a

puts letters_needed = alphabet.first(rows)
puts numbers_needed = numbers.first(columns)

final_list = []
letters_needed.each do |letter|
    final_list << letter.concat(#each number needed)
  end

print final_list
coords = letters_needed.zip(numbers_needed).flatten
