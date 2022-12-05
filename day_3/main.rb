require_relative "day_3"

puts "=" * 40
puts "Advent of Code - Day 3"
puts "=" * 40
input = File.read(File.join(__dir__, "input.txt"))
rucksacks = Rucksacks.new(input)
priority_sum_of_dupes = rucksacks.priority_sum_of_dupes
priority_sum_of_badges = rucksacks.priority_sum_of_badges
puts "Solution: priority_sum_of_dupes is #{priority_sum_of_dupes}"
puts "Solution: priority_sum_of_badges is #{priority_sum_of_badges}"
