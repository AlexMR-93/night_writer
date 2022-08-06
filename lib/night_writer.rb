require_relative("./night_reader")

night_reader = Nightreader.new(ARGV[0], ARGV[1])
puts("Created #{ARGV[1]} containing #{night_reader.write_file_count} characters")
