require_relative "../../test_helper"
require_relative "../day_5"

class Day5Test < Minitest::Test
  def input
    <<~INPUT
        [D]
    [N] [C]
    [Z] [M] [P]
     1   2   3

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
    INPUT
  end

  test "wat it do with example input" do
    expected = "CMZ"
    actual = Operator.for(crane_model: 9000, input:).top_crates
    assert_equal expected, actual
  end

  test "wat it dow with CraneMover9001" do
    expected = "MCD"
    actual = Operator.for(crane_model: 9001, input:).top_crates
    assert_equal expected, actual
  end
end
