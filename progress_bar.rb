

#queequeg1: on a terminal, \r will go to the beginning of a line without clearing it

30.times do |num|
  print "\r #{"*" * num}"
  sleep 0.02
end
puts ""