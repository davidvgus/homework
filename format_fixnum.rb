require 'win32console' if RUBY_PLATFORM =~ /mingw/

#learned from : https://github.com/Ramaze/ramaze/blob/master/lib/ramaze/helper/formatting.rb#L45-56

=begin
doctest: Test that format_num(1000000) outputs as string "1,000,000"
>> format_num(1000000)
=> "1,000,000"
=end

def format_num(int)
  int.to_s.reverse.scan(/\d{1,3}/).reverse.join(",")
end