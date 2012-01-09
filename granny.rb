require 'win32console' if RUBY_PLATFORM =~ /mingw/
load 'prompt.rb'

=begin
doctest: check to see if is_upcase
>> is_upcase?("HOWDY")
=> true
=end

def is_upcase?(string)
  string == string.upcase
end


=begin
doctest: return "HUH?! SPEAK UP, SONNY!"
>> complain
=> "HUH?! SPEAK UP, SONNY!"
=end

def complain
  "HUH?! SPEAK UP, SONNY!"
end


=begin
doctest: year method always returns a year between 1930 and 1950 (sample size 1000)
>> answers = []
>> 1000.times { answers << (1930..1950).include?(year) }
>> answers.include?(false)
=> false
=end


def year
  1930 + rand(21)
end



if __FILE__ == $0 then
  input = ""

  until input.include?("BYE")
    input = prompt("You say to Grandma: ")
    if is_upcase?(input)
      puts "NO, NOT SINCE %s!" % year
    else
      puts complain
    end
  end

  puts "BE A GOOD KID!  BYE!"
  
end
