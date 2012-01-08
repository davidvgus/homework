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
doctest: return a year between 1930 and 1950
>> y = year()
>> (1930..1950).include?(year)
=> true
=end

def year
  r = (1930..1950)
  r.to_a[rand(r.to_a.length)]
end



if __FILE__ == $0 then
  running = true

  while running do
    input = prompt("You say to Grandma: ")
    if input.include?("BYE")
      puts "BE A GOOD KID!  BYE!"
      running = false
    elsif is_upcase?(input)
      puts "NO, NOT SINCE %s!" % year
    else
      puts complain
    end
  end
end
