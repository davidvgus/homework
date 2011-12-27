require 'win32console'

=begin
This is a comment block
multiple lines
doctest: First doctest
>> "hello!"
=> "hello!"
doctest: I have another method here
>> hello
=> "hello"
doctest: I pass david to hello and get "Hello David!"
>> hello "David"
=> "hello David!"
doctest: If I forget to capitalize the name it will capitalize for me
>> hello 'david'
=> "hello David!"
doctest: I can even ask a question by add "?"
>> hello "Victor", "?"
=> "hello Victor?"
=end

#This is
#also

def hello name = "", punctuation = "!"
  "hello #{name.capitalize}#{punctuation}"
end

