#show_dir_changes.rb

# Name of the file that holds the list of the 2 most recent
# inventory files.
manifest = "manifest.txt"

previous_listing  = []
current_listing = []


def load_file_contents(file_name)
  File.open(file_name, "r") do |f|
    f.read.split("\n")
  end
end

def print_help_message(num_of_lines)
  puts "====================\n  Manifest Entries: %d\n  Entries Required: 2" % num_of_lines
  puts "  Please run listing.rb %d more time%s.\n====================" % [(2 - num_of_lines), ('s' if num_of_lines > 1)]
end

if File.exists?(manifest)
  previous_file, current_file = load_file_contents(manifest)
  
  #if previous_file && File.exists?(previous_file)
  #  previous_listing = load_file_contents(previous_file)
  #end
  previous_listing = load_file_contents(previous_file) if previous_file && File.exists?(previous_file)


  #if current_file && File.exists?(current_file)
  #  current_listing = load_file_contents(current_file)
  #end
  current_listing = load_file_contents(current_file) if current_file && File.exists?(current_file)
  
  if previous_listing && current_listing
    new_file_system_objects = current_listing - previous_listing
    new_file_system_objects.each {|f| puts f}
  else
    print_help_message(File.open("manifest.txt", "r").readlines.count)
  end
else
  puts "No manifest.txt file exists."
end






