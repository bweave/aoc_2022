require_relative "day_5"

puts "=" * 40
puts "Advent of Code - Day 5"
puts "=" * 40
input = File.read(File.join(__dir__, "input.txt"))
puts "Solution: CraneMover9000 top_crates are #{Operator.for(crane_model: 9000, input:).top_crates}"
puts "Solution: CraneMover9001 top_crates are #{Operator.for(crane_model: 9001, input:).top_crates}"
