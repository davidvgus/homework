require 'win32console' if RUBY_PLATFORM =~ /mingw/

=begin
doctest: First doctest
>> prompt("Enter:'test'>")
=> "test"
=end

def prompt(prompt_string)
  print prompt_string
  STDOUT.flush
  gets.chomp
end


if __FILE__ == $0 then
  # code block here 
end