require "./spec/spec_helper"
require "./lib/alphabet"
require "./lib/braille_english"


RSpec.describe(BrailleEnglish) do
  before((:each)) do
    @braille_english = BrailleEnglish.new("./spec/fixtures/test_input_braille.txt", "./spec/fixtures/test_output.txt")
  end

  it("exists") do
    expect(@braille_english).to(be_a(BrailleEnglish))
  end

  it("can count chars in file ") do
    expect(@braille_english.encrypt_message_count).to(eq(39))
  end

  it("can read the second file") do
    expect(@braille_english.second_file_reader).to(eq("..000.0.00..\n..0..0.00...\n..0.0.0.0...\n"))
  end

  it("can translate back from braille to english") do
    expect(@braille_english.translate("0.0.0.00\n..0..0..\n..0...00")).to(eq("alex"))
  end

  it("can input text to a new file encryted") do
    expect(@braille_english.file_writer).to(eq(true))
  end
end
