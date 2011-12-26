
def get_cell_size(int)
  (int * int).size
end

def generate_cell(column, number, cell_size)
  cell_contents = column * number
  "% #{cell_size}d" % cell_contents
end

def generate_row(row_number, number_of_cells)
  row = ""
  column = 2
  cell_size = (row_number * row_number).size
  (1..number_of_cells).each do |column|
    row &lt;&lt; generate_cell(column, row_number, cell_size)
  end
  row + "\n"

end

def generate_table(integer)
  table = ""
  (1...integer).each do |row_number|
    table &lt;&lt; generate_row(row_number, integer)
  end
  table
end

def add_decoration(decorate, decoration, table_string)
  table_string &lt;&lt; decoration + "\n"
end

def multiplication_table(integer, heading = '', decorate = false)
  unless (integer.is_a?(Fixnum) and heading.is_a?(String))
    puts "first argument must be an integer"
    exit
  end
  table_string = ""
  decoration_length = (get_cell_size(integer) * integer) + 2
  decoration = ("=" * decoration_length)


  if heading
    table_string &lt;&lt; heading + "\n"
  end

  if decorate
    add_decoration(decorate, decoration, table_string)

    table_string &lt;&lt; generate_table(integer)

    add_decoration(decorate, decoration, table_string)
  else
    table_string &lt;&lt; generate_table(integer)
  end


  table_string
end



table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20

puts table1
puts
puts table2