
WORKING_DIRECTORY = "/home/dave/repositories/homework"
MANIFEST_NAME = "manifest.txt"

manifest = File.join(WORKING_DIRECTORY, MANIFEST_NAME)

def generate_file_name
  "inventory_" << Time.now.to_s.gsub(/[ :-]/, " " => "_", ":" => "", "-" => "") << ".txt"
end

new_inventory_file_name = File.join( WORKING_DIRECTORY, generate_file_name)


File.open(new_inventory_file_name, "w") do |f|
  Dir.glob('**/*').sort.each do |file_system_object|
    f.write(file_system_object << "\n")
  end
end

if File.exists?(manifest)
  File.open(manifest, "r+") do |f|
    contents = f.readlines
    previous_file = contents[-1]
    f.pos = 0
    f.write(previous_file)
    f.write(new_inventory_file_name << "\n")
  end
else
  File.open(manifest, "w") do |f|
    f.write(new_inventory_file_name << "\n")
  end
end

