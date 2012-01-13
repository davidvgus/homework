require 'win32console' if RUBY_PLATFORM =~ /mingw/
load 'prompt.rb'

=begin
doctest: check to see if is_upcase
>> yelling?("HOWDY")
=> true
=end

def yelling?(string)
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
>> answers.all?
=> true
=end

#def asdf


def year
  1930 + rand(21)
end

def cold_granny
  "<Grandma Stares at you blankly>"
end

def no_not
  "NO, NOT SINCE %s!" % year
end

def later_toots
  "Don't you love your old Granny anymore?"
end


if __FILE__ == $0 then
  input = ""
  bye_count = 0

  until bye_count >= 3
    input = prompt("You say to Grandma: ")
    if yelling?(input)
      if input.include?("BYE")
        puts cold_granny
        bye_count += 1
      else
        bye_count = 0
        puts no_not
      end
    else
      bye_count = 0
      puts complain
    end
  end

  puts later_toots
end
