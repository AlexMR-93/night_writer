require "./lib/alphabet"

class Nightreader
  attr_reader :orginal_message_file, :encoded_message

  def initialize(orginal_message_file, encoded_message)
    @orginal_message_file = orginal_message_file
    @encoded_message = encoded_message
    @translater = Alphabet.new.alphabet
  end

  def write_file_count
    File.open(@orginal_message_file).size
  end

  def read_file_and_translate
    handle = File.open(@orginal_message_file, "r")
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
    writer = File.open(@encoded_message, "w")
    writer.write(read_file_and_translate)
    writer.close
  end
end
