require_relative "day_2"

puts "=" * 40
puts "Advent of Code - Day 2"
puts "=" * 40
input = File.read(File.join(__dir__, "input.txt"))
rock_paper_scissors = RockPaperScissors.new(input)
my_score = rock_paper_scissors.my_score
desired_outcome_score = rock_paper_scissors.desired_outcome_score
puts "Solution: my_score is #{my_score}"
puts "Solution: desired_outcome_score is #{desired_outcome_score}"
