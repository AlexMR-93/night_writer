require "./lib/alphabet"

class Nightreader
  attr_reader :read_file, :write_file

  def initialize(read_file, write_file)
    @read_file_x = read_file
    @write_file_x = write_file
    @translater = Alphabet.new.alphabet
  end

  def write_file_count
    File.open(@read_file_x).size
  end

  def read_file_and_translate
    handle = File.open(@read_file_x, "r")
    incoming_text = handle.read.chomp
    handle.close
    translate(incoming_text)
  end

  def translate(message)
    letters = message.chars
    top = []
    middle = []
    bottom = []

    letters.each do |letter|
      top << @translater[letter][0, 2]
      middle << @translater[letter][2, 2]
      bottom << @translater[letter][4, 2]
    end

    [top.join, middle.join, bottom.join].join("\n")
  end

  def write_file
    writer = File.open(@write_file_x, "w")
    writer.write(read_file_and_translate)
    writer.close
  end
end
