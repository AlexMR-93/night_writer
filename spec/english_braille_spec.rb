require "./spec/spec_helper"
require "./lib/alphabet"
require "./lib/english_braille"


RSpec.describe(EnglishBraille) do
  before((:each)) do
    @english_braille = EnglishBraille.new("./spec/fixtures/test_input.txt", "./spec/fixtures/test_output.txt")
  end

  it("exists") do
    expect(@english_braille).to(be_a(EnglishBraille))
  end

  it("can count chars of file ") do
    expect(@english_braille.orginal_message_file_count).to(eq(5))
  end

  it("can read the text files") do
    expect(@english_braille.file_reader).to(eq("alex"))
  end

  it(" can translate an english word to braille") do
    expect(@english_braille.translate("alex")).to(eq("0.0.0.00\n..0..0..\n..0...00"))
  end

  it("can input text to a new file decrypted") do
    expect(@english_braille.encrypted_file).to(eq(true))
  end
end
