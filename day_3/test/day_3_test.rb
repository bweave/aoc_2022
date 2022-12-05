require_relative "../../test_helper"
require_relative "../day_3"

class Day3Test < Minitest::Test
  def input
    <<~INPUT
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    INPUT
  end

  test "it finds the priority sum of duplicate items" do
    expected = 157
    actual = Rucksacks.new(input).priority_sum_of_dupes
    assert_equal expected, actual
  end

  test "if finds the priority sum of elf group's badges" do
    expected = 70
    actual = Rucksacks.new(input).priority_sum_of_badges
    assert_equal expected, actual
  end
end
