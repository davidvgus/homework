#none of this is my code, but I can't remember where it all came from
#testing git, added this comment.
require 'win32console'

begin
  require 'Win32/Console/ANSI' if RUBY_PLATFORM =~ /win32/
rescue LoadError
  raise 'You must gem install win32console to use color on Windows'
end


[0, 1, 4, 5, 7].each do |attr|
  puts '----------------------------------------------------------------'
  puts "ESC[#{attr};Foreground;Background"
  30.upto(37) do |fg|
    40.upto(47) do |bg|
      print "\033[#{attr};#{fg};#{bg}m #{fg};#{bg}  "
    end
  puts "\033[0m"
  end
end

class String
  def red
    "\e[31m#{self}\e[0m"
  end
end

puts "Hello, World!".red



require 'term/ansicolor'

class String
  include Term::ANSIColor
end

puts "Hello, World!".red
puts "Hello, World!".blue
puts "Annoy me!".blink.yellow.bold