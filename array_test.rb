def mtdarry
  10.times do |num|
    puts num
    square = num * num
    return num, square if num > 5
  end
end

num, square = mtdarry
puts num
puts square

puts ARGV