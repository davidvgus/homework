require 'win32console' if RUBY_PLATFORM =~ /mingw/

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

=begin
doctest: This should return the x lines with the line prefix
>> s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
>> parse_s(s)
=> "Line 1: Welcome to the forum.\nLine 2: Here you can learn Ruby.\nLine 3: Along with other members.\n"
=end

def parse_s(string)
  parsed_string = ""
  string.split("\n").each.with_index(1) do |line, line_number|
    parsed_string << "Line %d: %s\n" % [line_number, line]
  end
  parsed_string
end

print parse_s(s)

