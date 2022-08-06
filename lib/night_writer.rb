class Nightwriter
  attr_reader :read_file, :write_file

  def initialize(read, write)
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end
end

Nightwriter.new
