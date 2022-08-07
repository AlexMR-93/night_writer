require "./lib/alphabet"

class EnglishBraille
  attr_reader :orginal_message_file, :encrypted_message

  def initialize(orginal_message_file, encrypted_message)
    @orginal_message_file = orginal_message_file
    @encrypted_message = encrypted_message
    @translater_key = Alphabet.new.alphabet
  end

  def orginal_message_file_count
    File.open(@orginal_message_file).size
  end

  def file_encryptor
    handle = File.open(@orginal_message_file, "r")
    incoming_text = handle.read.chomp
    handle.close
    translate(incoming_text)
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

  def e_file
    encrypted_file = File.open(@encrypted_message, "w")
    encrypted_file.write(file_encryptor)
    encrypted_file.close
  end
end
