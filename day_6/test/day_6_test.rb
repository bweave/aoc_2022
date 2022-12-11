require_relative "../../test_helper"
require_relative "../day_6"

class Day6Test < Minitest::Test
  test "start of packet marker" do
    input = "bvwbjplbgvbhsrlpgdmjqwftvncz"
    expected = 5
    actual = Comms.start_of_packet_marker_for(input)
    assert_equal expected, actual

    input = "nppdvjthqldpwncqszvftbrmjlhg"
    expected = 6
    actual = Comms.start_of_packet_marker_for(input)
    assert_equal expected, actual

    input = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
    expected = 10
    actual = Comms.start_of_packet_marker_for(input)
    assert_equal expected, actual

    input = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
    expected = 11
    actual = Comms.start_of_packet_marker_for(input)
    assert_equal expected, actual
  end

  test "start of message marker" do
    input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
    expected = 19
    actual = Comms.start_of_message_marker_for(input)
    assert_equal expected, actual

    input = "bvwbjplbgvbhsrlpgdmjqwftvncz"
    expected = 23
    actual = Comms.start_of_message_marker_for(input)
    assert_equal expected, actual

    input = "nppdvjthqldpwncqszvftbrmjlhg"
    expected = 23
    actual = Comms.start_of_message_marker_for(input)
    assert_equal expected, actual

    input = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
    expected = 29
    actual = Comms.start_of_message_marker_for(input)
    assert_equal expected, actual

    input = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
    expected = 26
    actual = Comms.start_of_message_marker_for(input)
    assert_equal expected, actual
  end
end
