
file_name = "listtest.txt"

previous_listing  = []

File.open(file_name, "r") do |f|
  previous_listing  = f.read.split("\n")
  #previous_listing  = f.readlines
end

current_listing = Dir.glob('**/*').sort

new_file_system_objects = current_listing - previous_listing

new_file_system_objects.each {|f| puts f.upcase}

