string = ARGV[0]

x = 3 
string.length.times do
  string.length.times do |n2|
    test_string = string.slice(n2, x)
    bleh = test_string.scan(/#{test_string.reverse}/)[0]
    puts bleh if bleh.length > 2
  end
  x += 1
end
