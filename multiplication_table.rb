
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
    row << generate_cell(column, row_number, cell_size)
  end
  row + "\n"

end

def generate_table(integer)
  table = ""
  (1...integer).each do |row_number|
    table << generate_row(row_number, integer)
  end
  table
end



def multiplication_table(integer, heading = '', decorate = false)
  table_string = ""
  decoration = "="
  decoration_length = (get_cell_size(integer) * integer) + 2

  if heading
    table_string << heading + "\n"
  end

  if decorate
    table_string << (decoration * decoration_length) + "\n"
  end

  table_string << generate_table(integer)

  if decorate
    table_string << (decoration * decoration_length) + "\n"
  end

  table_string
end



table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20

puts table1
puts
puts table2