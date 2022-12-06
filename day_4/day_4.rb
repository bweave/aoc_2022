class CleaningAssignments
  def initialize(input)
    @assignments =
      input.each_line.map { |assignments| Assignments.new(assignments) }
  end

  def fully_overlapping_count
    assignments.count(&:fully_overlapping?)
  end

  def any_overlapping_count
    assignments.count(&:any_overlapping?)
  end

  private

  attr_reader :assignments
end

class Assignments
  def initialize(assignments)
    @sections =
      assignments
        .split(",")
        .map do |a|
          starting_at, ending_at = a.split("-")
          starting_at.to_i..ending_at.to_i
        end
  end

  def fully_overlapping?
    first_sections, second_sections = sections
    first_sections.all? { |section| second_sections.include?(section) } ||
      second_sections.all? { |section| first_sections.include?(section) }
  end

  def any_overlapping?
    first_sections, second_sections = sections
    first_sections.any? { |section| second_sections.include?(section) } ||
      second_sections.any? { |section| first_sections.include?(section) }
  end

  private

  attr_reader :sections
end
