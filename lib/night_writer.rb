class Nightwriter
  attr_reader :read_file, :write_file

  def initialize(read_file, write_file)
    @read_file_x = ARGV[0]
    @write_file_x = ARGV[1]
    ARGV == [ARGV[0], ARGV[1]]
  end

  def write_file_count
    bean = File.new(ARGV[1])
    bean.size
  end

  def read_file
    handle = File.open(ARGV[0], "r")
    incoming_text = handle.read
    handle.close
  end

  def write_file
    writer = File.open(ARGV[0], "w")
    writer.write(ARGV)
    writer.close
  end
end

night_writer = Nightwriter.new(ARGV[0], ARGV[1])
puts("Created #{ARGV[1]} containing #{night_writer.write_file_count} characters")
