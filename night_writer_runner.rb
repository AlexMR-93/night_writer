require_relative("./lib/night_reader")

night_reader = Nightreader.new(ARGV[0], ARGV[1])
night_reader.write_file
puts("Created #{ARGV[1]} containing #{night_reader.orginal_message_file_count} characters")
