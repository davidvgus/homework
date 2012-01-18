#create_random_files.rb

def validate_num(input)
  unless input.is_a?(Integer)
    puts "Please enter an integer argument."
    exit
  end
end

def create_random_file(number_of_files)
  number_of_files = number_of_files.to_i
  validate_num(number_of_files)
  number_of_files.times do |num|
    filename = "AAA0%0#{number_of_files.to_s.length}d.txt" % num
    unless File.exists?(filename)
      File.open(filename, "w") do |f|
      f.write(filename)
      end
    end
  end
end


number_of_files = ARGV[0]

create_random_file(number_of_files)