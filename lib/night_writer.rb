class Nightwriter
  attr_reader :read_file, :write_file

  def initialize(read_file, write_file)
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    ARGV == [ARGV[0], ARGV[1]]
  end

  def write_file_count
    File.new(ARGV[1]).size
  end

  def write_file
    writer = File.open(ARGV[1], "w")
    writer.write(read_file)
    writer.close
  end
end

night_writer = Nightwriter.new(ARGV[0], ARGV[1])
puts("Created #{ARGV[1]} containing #{night_writer.write_file_count} characters")
