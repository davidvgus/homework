#lesson7exercise1a.rb
require './lesson7exercise1.rb'

k = Klass.new("howdy")

puts "say_hello results before marshalling: " << k.say_hello
puts "initial id: " << k.object_id.to_s

File.open('saved_object', 'w+') do |f|
  Marshal.dump(k, f)
end

# Destroy the reference to the old object and just to be complete
# create a new variable to hold the new object.
k , k2 = nil

File.open('saved_object') do |f|
  k2 = Marshal.load(f)
end


puts "This is from the marshalled object " << k2.say_hello << "."
puts "Marshalled id: " << k2.object_id.to_s

