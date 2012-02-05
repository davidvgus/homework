#loadsave.rb

def load_game(file)
  open(file, "r") do |f|
    score, internal_time_stamp = f.readlines("\n")
    begin
      if internal_time_stamp.to_i != f.mtime.to_i
        raise RuntimeError, "I suspect you of cheating."
      else
        puts "Your saved score is %d" % score
      end
    rescue RuntimeError => e
      puts e.message
    end
  end
end


def save_game(file)
 score = 1000
 open(file, "w") do |f|
 f.puts(score)
 f.puts(Time.new.to_i)
 end
end


if __FILE__ == $0 then
save_game("game.sav")
sleep(2)
load_game("game.sav") # => "Your saved score is 1000."
# Now let's cheat by increasing our score to 9000
open("game.sav", "r+b") { |f| f.write("9") }
load_game("game.sav") # RuntimeError: I suspect you of cheating.
end
