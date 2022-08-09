require "./lib/braille_english"

night_reader = BrailleEnglish.new(ARGV[0], ARGV[1])
night_reader.file_writer
puts("Created #{ARGV[1]} containing #{night_reader.encrypt_message_count} characters")
