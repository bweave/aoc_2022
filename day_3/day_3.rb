class Rucksacks
  PRIORITIES = [[*"a".."z", *"A".."Z"], [*1..52]].transpose.to_h.freeze

  def initialize(input)
    @rucksacks = input.each_line.map { |i| Rucksack.new(i.strip) }
  end

  def priority_sum_of_dupes
    rucksacks
      .flat_map(&:compartment_dupe_priorities)
      .map { |dup| PRIORITIES[dup] }
      .sum
  end

  def priority_sum_of_badges
    raise "Non-even groups" if rucksacks.size % 3 > 0

    rucksacks
      .map(&:inventory)
      .each_slice(3)
      .flat_map { |a, b, c| (a & b & c).map { |dup| PRIORITIES[dup] } }
      .sum
  end

  private

  attr_reader :rucksacks
end

class Rucksack
  attr_reader :inventory

  def initialize(inventory)
    @inventory = inventory.chars
  end

  def compartment_dupe_priorities
    half = inventory.size / 2
    compartment1 = inventory.first(half)
    compartment2 = inventory.last(half)
    (compartment1 & compartment2)
  end
end
