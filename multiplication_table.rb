require 'win32console'

=begin
doctest: get_cell_size: (4 * 4)  == 16.  16.to_s.length + 1 = 3
>> get_cell_size(4)
=> 3
=end

def get_cell_size(int)
  (int * int).to_s.length + 1
end

def generate_cell(column, number, cell_size)
  cell_contents = column * number
  "% #{cell_size}d" % cell_contents
end

def generate_row(row_number, number_of_cells)
  row = ""
  column = 2
  cell_size = get_cell_size(number_of_cells)
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

def add_decoration(decorate, decoration, table_string)
  table_string << decoration << "\n"
end

def multiplication_table(integer, heading = false, decorate = false)
  unless (integer.is_a?(Fixnum))
    puts "first argument must be an integer"
    exit
  end
  table_string = ""
  decoration_length = (get_cell_size(integer) * integer) + 1
  decoration = ("=" * decoration_length)


  table_string << heading << "\n" if heading

  if decorate
    add_decoration(decorate, decoration, table_string)

    table_string << generate_table(integer)

    add_decoration(decorate, decoration, table_string)
  else
    table_string << generate_table(integer)
  end


  table_string
end



table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20

puts table1
puts
puts table2