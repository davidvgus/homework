require 'win32console' if RUBY_PLATFORM =~ /mingw/

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

=begin
doctest: This should return the x lines with the line prefix
>> s = "abc\ndef\nghi"
>> parse_s(s)
=> "Line 1: abc\nLine 2: def\nLine 3: ghi\n"
=end

def parse_s(string)
  parsed_string = ""
  string.split("\n").each.with_index do |line, line_number|
    parsed_string << "Line %d: %s\n" % [line_number + 1, line]
  end
  parsed_string
end

puts parse_s(s)

