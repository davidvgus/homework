
FILE_LINES = 1000
COLUMN_WIDTH = FILE_LINES.to_s.length

File.open("lines.txt", 'w') do |f|
  FILE_LINES.times do  |index|
    f.write((index + 1).to_s + "\n")
  end
end

File.open("lines_with_heading.txt", 'w') do |f|
  FILE_LINES.times do  |index|
    line_number = index + 1
    f.write("Line %0#{COLUMN_WIDTH}d:  %s\n" % [line_number, line_number.to_s])
  end
end