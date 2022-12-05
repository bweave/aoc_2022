require_relative "../../test_helper"
require_relative "../day_2"

class Day2Test < Minitest::Test
  def input
    <<~INPUT
    A Y
    B X
    C Z
    INPUT
  end

  test "part 1 calculates my score based on x: rock, y: paper, z: scissors" do
    expected = 15
    actual = RockPaperScissors.new(input).my_score
    assert_equal expected, actual
  end

  test "part 2 calculates desired outcome base on x: lose, y: draw, z: win" do
    expected = 12
    actual = RockPaperScissors.new(input).desired_outcome_score
    assert_equal expected, actual
  end
end
