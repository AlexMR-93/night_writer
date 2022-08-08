require_relative("./lib/english_braille")

night_reader = EnglishBraille.new(ARGV[0], ARGV[1])
night_reader.encrypted_file
puts("Created #{ARGV[1]} containing #{night_reader.orginal_message_file_count} characters")
