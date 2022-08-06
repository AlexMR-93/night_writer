class Nightreader
  attr_reader :read_file, :write_file

  def initialize(read_file, write_file)
    @read_file_x = read_file
    @write_file_x = write_file
  end

  def write_file_count
    File.open(@read_file_x).size
  end

  def read_file
    handle = File.open(@read_file_x, "r")
    incoming_text = handle.read
    handle.close
  end

  def write_file
    writer = File.open(ARGV[0], "w")
    writer.write(ARGV)
    writer.close
  end
end
