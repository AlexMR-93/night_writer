require "./lib/alphabet"
require "./lib/english_braille"

class BrailleEnglish
  include Alphabet
  attr_accessor :encrypted_message, :final_message

  def initialize(encrypted_message, final_message)
    @encrypted_message = encrypted_message
    @final_message = final_message
    @non_braille = alphabet.invert
  end

  def encrypt_message_count
    File.open(@encrypted_message).size
  end

  def second_file_reader
    handle = File.open(@encrypted_message, "r")
    incoming_text = handle.read
    handle.close
    incoming_text
  end

  def translate(encrypted_message)
    e_message = encrypted_message.split("\n")

    e_message_format = e_message.map do |g|
      g.chars.each_slice(2).map(&:join)
    end

    top = e_message_format[0]
    middle = e_message_format[1]
    bottom = e_message_format[2]
    translated = []

    top.each_with_index do |val, index|
      braille_string = [top[index], middle[index], bottom[index]].join
      translated << @non_braille[braille_string]
    end

    translated.join
  end

  def file_writer
    handle = File.new(@final_message, "w")
    chars = handle.write(translate(second_file_reader))

    if chars > 0
      handle.close
      return true
    end
  end
end
