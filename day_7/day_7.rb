FileSystem =
  Struct.new(:fs) do
    def self.for(input)
      # Parse
      # / is the root of all things
      # $ is a command so ignore
      # dir is a directory with files and more dirs
      #   collect children until we get a command
      # digit is a file in the form <size name(.ext)>
      input
        .split("\n")
        .map do |line|
          case line
          when /^\$/
            [:command, line]
          when /^dir/
            name = line.scan(/dir (\w+)/)
            [:directory, name]
          when /^\d/
            size, name = line.scan(/(\d+) ([\w\.]+)/)
            [:file, [name, size]]
          else
            fail "unknown line type: ${line}"
          end
        end
    end
  end
