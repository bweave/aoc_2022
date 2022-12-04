class Calories
  def initialize(input)
    @elf_calories =
      input
        .split("\n\n")
        .map { |calorie_inventory| ElfCaloriesCarrying.new(calorie_inventory) }
  end

  def highest_calorie_count
    calorie_totals.last
  end

  def top_3_calorie_counts_total
    calorie_totals.last(3).sum
  end

  private

  attr_reader :elf_calories

  def calorie_totals
    @calorie_totals ||= elf_calories.map(&:total_calories).sort
  end

  class ElfCaloriesCarrying
    def initialize(payload)
      @payload = payload.split("\n").map(&:to_i)
    end

    def total_calories
      @total_calories ||= payload.sum
    end

    private

    attr_reader :payload
  end
end
