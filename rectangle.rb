require 'win32console' if RUBY_PLATFORM =~ /mingw/

=begin
doctest: testing rectangle creation without parameters
>> begin
?> r = Rectangle.new()
?> rescue ArgumentError
?> "This is an exception: #{$!}"
?> end
=> "This is an exception: wrong number of arguments (0 for 2)"
=end

class Rectangle

  def initialize(length, width)
    @length = length
    @width = width
  end

=begin
doctest: Test peremeter
>> r1 = Rectangle.new(1.0, 2.0)
>> r1.perimeter
=> 6.0


=end

  def perimeter
    2 * @length + 2 * @width
  end

=begin
doctest: Test area
>> r2 = Rectangle.new(1.0, 2.0)
>> r2.area
=> 2.0
=end

  def area
    @length * @width
  end

end



