require_relative "day_6"

puts "=" * 40
puts "Advent of Code - Day 6"
puts "=" * 40
input = File.read(File.join(__dir__, "input.txt"))
start_of_packet_marker = Comms.start_of_packet_marker_for(input)
start_of_message_marker = Comms.start_of_message_marker_for(input)
puts "Solution: start_of_packet_marker is #{start_of_packet_marker}"
puts "Solution: start_of_message_marker is #{start_of_message_marker}"
