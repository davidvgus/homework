require './prompt'

running = true

while running
  input = prompt(">>").chomp
  unless input == "exit"
    begin
    return_value =  (eval(input)).to_s
    unless return_value =~ /^nil$/
      puts "=> nil"
    else
      puts "=> " &lt;&lt; return_value.to_s
    end

    rescue Exception => e
      puts e.message
    end
  else
    running = false
  end
end