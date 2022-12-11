require_relative "../../test_helper"
require_relative "../day_7"

class Day7Test < Minitest::Test
  def input
    <<~INPUT
    $ cd /
    $ ls
    dir a
    14848514 b.txt
    8504156 c.dat
    dir d
    $ cd a
    $ ls
    dir e
    29116 f
    2557 g
    62596 h.lst
    $ cd e
    $ ls
    584 i
    $ cd ..
    $ cd ..
    $ cd d
    $ ls
    4060174 j
    8033020 d.log
    5626152 d.ext
    7214296 k
    INPUT
  end

  test "it can find dirs with a size of at most 100_000" do
    # expected a and e
    FileSystem.for(input)
  end

  test "it can sum dirs with a size of at most 100_000" do
    skip
    expected = 95_437
  end
end
