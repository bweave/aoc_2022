# part 1
# A => Rock, B => Paper, C => Scissors
# X => Rock, Y => Paper, Z => Scissors

# part 2
# A => Rock, B => Paper, C => Scissors
# X => lose, Y => draw, Z => win

class RockPaperScissors
  SCORES = { "A" => 1, "B" => 2, "C" => 3, "X" => 1, "Y" => 2, "Z" => 3 }.freeze
  WIN = { "C" => "X", "B" => "Z", "A" => "Y" }.freeze
  LOSE = { "C" => "Y", "B" => "X", "A" => "Z" }.freeze
  DRAW = { "A" => "X", "B" => "Y", "C" => "Z" }.freeze
  WIN_ADDITION = 6
  DRAW_ADDITION = 3

  def initialize(input)
    @rounds = input.split("\n").map(&:split)
  end

  def my_score
    @rounds.sum do |elf, me|
      points = SCORES[me]

      if WIN[elf] == me
        points += WIN_ADDITION
      elsif DRAW[elf] == me
        points += DRAW_ADDITION
      end

      points
    end
  end

  def desired_outcome_score
    @rounds.sum do |(elf, win_lose_draw)|
      case win_lose_draw
      when "X"
        SCORES[LOSE[elf]]
      when "Y"
        SCORES[elf] + DRAW_ADDITION
      when "Z"
        SCORES[WIN[elf]] + WIN_ADDITION
      end
    end
  end
end
