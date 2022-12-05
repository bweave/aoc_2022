require_relative "day_1"

puts "=" * 40
puts "Advent of Code - Day 1"
puts "=" * 40
input = File.read(File.join(__dir__, "input.txt"))
calories = Calories.new(input)
highest_calorie_count = calories.highest_calorie_count
top_3_total = calories.top_3_calorie_counts_total
puts "Solution: highest calorie count is #{highest_calorie_count}"
puts "Solution: top 3 calorie counts are #{top_3_total}"
