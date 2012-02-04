#mp3_info.rb

File.open('song.mp3', 'r') do |f|
  f.seek(-128, IO::SEEK_END)
  tag_location_value = f.read(3)

  mp3_info = {}

  headings = {:title => 30, :artist => 30, :album => 30, :year => 4}

  if tag_location_value == "TAG"
    headings.each do |heading, len|
      mp3_info[heading] = f.read(len).gsub(/\s+$/, "")
    end
  end
  
  mp3_info.each do |k, v|
    puts "%s: %s" % [k.to_s.capitalize,v]
  end
end