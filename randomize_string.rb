

string_to_be_randomized = "It was a dark and stormy night."

array_from_plain_string = string_to_be_randomized.scan(/./)

randomized_array = []


while array_from_plain_string.length > 0
  random_index = rand(array_from_plain_string.length)
  character = array_from_plain_string.delete_at(random_index)
  randomized_array << character
end

puts string_to_be_randomized
puts string_to_be_randomized.length
puts randomized_array.join
puts randomized_array.length

class UnpredictableString < String
  def scramble

  end
end

#the right way
string_to_be_randomized.chars.to_a.shuffle.join

