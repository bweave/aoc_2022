Comms =
  Struct.new(:input, :marker_length) do
    def self.start_of_packet_marker_for(input)
      new(input, 4).find_marker
    end

    def self.start_of_message_marker_for(input)
      new(input, 14).find_marker
    end

    def find_marker
      input
        .chars
        .each_cons(marker_length)
        .with_index
        .reduce(marker_length) do |acc, (quad, i)|
          break acc += i if quad.tally.none? { |letter, count| count > 1 }
          acc
        end
    end
  end
