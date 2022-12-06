require_relative "day_4"

puts "=" * 40
puts "Advent of Code - Day 4"
puts "=" * 40
input = File.read(File.join(__dir__, "input.txt"))
cleaning_assignments = CleaningAssignments.new(input)
fully_overlapping_count = cleaning_assignments.fully_overlapping_count
any_overlapping_count = cleaning_assignments.any_overlapping_count
puts "Solution: fully_overlapping_count is #{fully_overlapping_count}"
puts "Solution: any_overlapping_count is #{any_overlapping_count}"
