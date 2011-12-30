require 'win32console' if RUBY_PLATFORM =~ /mingw/

=begin
doctest: Testing prompt
>> prompt("Enter:'test'>", "test_string")
=> "test_string"
NOTE TO SELF  WRITE NEW TESTS!
=end

def prompt(prompt_string, test_string = nil)
  print prompt_string
  STDOUT.flush
  if test_string
    test_string.chomp
  else
    gets.chomp
  end
end


if __FILE__ == $0 then
  # code block here 
end