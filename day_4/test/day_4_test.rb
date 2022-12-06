require_relative "../../test_helper"
require_relative "../day_4"

class Day4Test < Minitest::Test
  def input
    <<~INPUT
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    INPUT
  end

  test "it counts the number of assignments where one fully overlaps the other" do
    expected = 2
    actual = CleaningAssignments.new(input).fully_overlapping_count
    assert_equal expected, actual
  end

  test "it counts the number of assingments where there is any overlap at all" do
    expected = 4
    actual = CleaningAssignments.new(input).any_overlapping_count
    assert_equal expected, actual
  end
end
