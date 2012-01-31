#gameboard.rb

class GameBoard
  def set_locations_cells(selected_cells)
    @cells = selected_cells
  end

  def check_yourself(guess)
    guess = guess.to_i

    puts "guess is " << guess.inspect << " a: " << guess.class.to_s
    if @cells.include?(guess)
      @cells.delete(guess)
      if @cells.empty?
        puts "End"
        "kill"
      else
        puts "Hit"
        "Hit"
      end
    else
      puts "Miss"
      "Miss"
    end
  end
end