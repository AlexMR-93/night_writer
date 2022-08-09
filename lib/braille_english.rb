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
    x = encrypted_message.split("\n")

    #x.map do |g|
    #  g.chars.each_slice(2) do |a|
      #  require "pry"
      #  binding.pry
      #end
    #end
    a = x.map do |g|
      g.chars.each_slice(2).map(&:join)
    end

    top = a[0]
    middle = a[1]
    bottom = a[2]
    translated = []

    top.each_with_index do |val, index|
      br = [val, middle[index], bottom[index]].join
      translated << @non_braille[br]
    end

    require "pry"

    binding.pry
    all_in_line = [top, middle, bottom].join
  end

  def file_writer
    handle = File.new(@final_message, "w")
    handle.write(translate(second_file_reader))
    handle.close
  end
end
