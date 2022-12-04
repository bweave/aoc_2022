require_relative "../../test_helper"
require_relative "../day_1"

class Day1Test < Minitest::Test
  def input
    <<~INPUT
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
    INPUT
  end

  test "it finds the calorie total of the elf with the most calories" do
    expected = 24000
    actual = Calories.new(input).highest_calorie_count
    assert_equal expected, actual
  end

  test "it finds the calorie total of the top 3 elves with the most calories" do
    expected = 45_000
    actual = Calories.new(input).top_3_calorie_counts_total
    assert_equal expected, actual
  end
end
