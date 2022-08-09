require "./lib/alphabet"

class EnglishBraille
  include Alphabet
  attr_reader :orginal_message_file, :encrypted_message

  def initialize(orginal_message_file, encrypted_message)
    @orginal_message_file = orginal_message_file
    @encrypted_message = encrypted_message
    @translater_key = alphabet
  end

  def orginal_message_file_count
    File.open(@orginal_message_file).size
  end

  def file_reader
    handle = File.open(@orginal_message_file, "r")
    incoming_text = handle.read.delete("\n")
    handle.close
    incoming_text
  end

  def translate(o_message)
    letters = o_message.chars
    top = []
    middle = []
    bottom = []

    letters.each do |letter|
      top << @translater_key[letter][0, 2]
      middle << @translater_key[letter][2, 2]
      bottom << @translater_key[letter][4, 2]
    end

    [top.join, middle.join, bottom.join].join("\n")
  end

  def encrypted_file
    encrypted_file = File.open(@encrypted_message, "w")
    chars = encrypted_file.write(translate(file_reader))

    if chars > 0
      encrypted_file.close
      return true
    end
  end
end
