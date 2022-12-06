require "forwardable"
require "pry"

Instructions =
  Struct.new(:instructions) do
    include Enumerable

    Instruction = Struct.new(:quantity, :from, :to)

    def self.for(instruction_instructions)
      instructions =
        instruction_instructions.map do |m|
          quantity, from, to = m.scan(/\d+/).map(&:to_i)
          Instruction.new(quantity, from - 1, to - 1)
        end

      new(instructions)
    end

    def each(&block)
      block_given? ? instructions.each(&block) : to_enum(:each)
    end
  end

Crate =
  Struct.new(:letter) do
    alias to_s letter

    def empty?
      letter.strip.empty?
    end

    def deep_dup
      self.class.new(letter.dup)
    end
  end

Stack =
  Struct.new(:crates) do
    extend Forwardable
    include Enumerable

    def_delegators :crates, :prepend, :shift

    def add(crate)
      crates.push(crate) unless crate.empty?
    end

    def each(&block)
      block_given? ? crates.each(&block) : to_enum(:each)
    end

    def deep_dup
      self.class.new(crates.map(&:deep_dup))
    end
  end

Stacks =
  Struct.new(:stacks) do
    extend Forwardable
    include Enumerable

    def self.for(crates_and_stack_numbers)
      stack_count = crates_and_stack_numbers[-1].strip.split[-1].to_i
      stacks = Array.new(stack_count) { Stack.new([]) }
      crates_and_stack_numbers[..-2].map do |line|
        brackets = /\[|\]/
        spaces = /\s{3,4}/
        letter = /\w/
        line
          .gsub(brackets, "")
          .scan(/#{spaces}|#{letter}/)
          .map { |crate_letter| Crate.new(crate_letter) }
          .each_with_index { |crate, i| stacks[i].add(crate) }
      end
      new(stacks)
    end

    def_delegators :stacks, :[]

    def each(&block)
      block_given? ? stacks.each(&block) : to_enum(:each)
    end

    def deep_dup
      self.class.new(stacks.map(&:deep_dup))
    end
  end

class Operator
  def self.for(crane_model:, input:)
    crates_and_stack_numbers, raw_instructions =
      input.split("\n\n").map { |line| line.split("\n") }
    instructions = Instructions.for(raw_instructions)
    stacks = Stacks.for(crates_and_stack_numbers)
    crane = Crane.for(model: crane_model)

    new(crane:, stacks:, instructions:)
  end

  def initialize(crane:, stacks:, instructions:)
    @instructions = instructions
    @stacks = stacks
    @crane = crane
  end

  def top_crates
    crane.top_crates_for(stacks:, instructions:)
  end

  private

  attr_reader :crane
  attr_reader :instructions
  attr_reader :stacks
end

class Crane
  def self.for(model:)
    crane =
      case model
      when 9000
        CraneMover9000
      when 9001
        CraneMover9001
      else
        fail "#{model} is an unknown Crane model"
      end

    crane.new
  end

  def top_crates_for(stacks:, instructions:)
    reorder_stacks(instructions:, stacks:).map(&:first).join
  end

  private

  def reorder_stacks(instructions:, stacks:)
    fail NotImplementedError,
         "#reorder_crates must be implemented by subclasses"
  end
end

class CraneMover9000 < Crane
  private

  def reorder_stacks(instructions:, stacks:)
    stacks.deep_dup.tap do |s|
      instructions.each do |m|
        m => { quantity:, from:, to: }
        s[from].shift(quantity).each { |crate| s[to].prepend(crate) }
      end
    end
  end
end

class CraneMover9001 < Crane
  private

  def reorder_stacks(instructions:, stacks:)
    stacks.deep_dup.tap do |s|
      instructions.each do |m|
        m => { quantity:, from:, to: }
        s[from].shift(quantity).reverse.each { |crate| s[to].prepend(crate) }
      end
    end
  end
end
