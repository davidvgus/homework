require 'win32console' if RUBY_PLATFORM =~ /mingw/

#s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"


=begin
doctest: This should return the x lines with the line prefix
>> s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
>> parse_s(s)
=> "Line 1: Welcome to the forum.\nLine 2: Here you can learn Ruby.\nLine 3: Along with other members.\n"
doctest: testing on string from file
>>file = File.open("lines.txt", "r")
>>test_data = file.read
>>output_file = File.open("lines_with_heading.txt", "r")
>>test_output = output_file.read
>>parse_s(test_data)
=>test_output
=end

def parse_s(string)
  parsed_string = ""
  cell_size = string.split("\n").count.to_s.length
  string.each_line.with_index(1) do |line, line_number|
    parsed_string << "Line %0#{cell_size}d: %s" % [line_number, line]
  end
  parsed_string
end

file = File.open("lines.txt", "r")
test_data = file.read

print parse_s(test_data)

