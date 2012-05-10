string = ARGV[0]

x = 3 
longest_match = ""

string.length.times do
  string.length.times do |n2|
    test_string = string.slice(n2, x)
    result = test_string.scan(/#{test_string.reverse}/)[0]
    if !result.nil? && result.length > 2
      #puts result
      longest_match = result if result.length > longest_match.length
    end
  end
  x += 1 
end

puts longest_match
