

=begin
doctest: Create a Point and call its point() method
>> point = Point.new(10,10)
>> point.point
=> [10,10]
doctest: Create a Point, then move it.
>> point2 = Point.new(100,100)
>> point2.move(20,20)
>> point2.point
=> [20,20]
=end
class Point
  attr_accessor :x, :y
  def initialize(x = 0,y = 0)
    @x = x
    @y = y
  end

  def move(x,y)
    @x, @y = x, y
  end

  def point
    [@x,@y]
  end
end

=begin
doctest: Create a shape.
>> shape = Shape.new(10,10)
>> shape.position
=> [10,10]
doctest: Rotate by 30 degrees
>> shape.rotate(30)
=> 30
=end

class Shape
  attr_accessor :position
  def initialize(x,y)
    @position = Point.new(x,y)
    @heading_degrees = 0
  end

  def position
    @position.point
  end

  def rotate(degrees, direction="clockwise")
    @heading_degrees = (@heading_degrees + degrees) % 360
  end

  def rotate_over_time(degrees, direction="clockwise", seconds)
    milliseconds = seconds / 1000.0
    milliseconds_per_degree = milliseconds / degrees.to_f
    degrees.times do
      @heading_degrees = (@heading_degrees + 1) % 360
      puts "sleeping for #{milliseconds_per_degree}"
      puts "Degree is %s" % @heading_degrees
      sleep milliseconds_per_degree
    end
  end
end

class RegularPolygon
  def initialize(x,y,side_length)
    super(x,y)
    @side_length = side_length
  end
end

class Circle < Shape
  def initialize(x,y, radius)
    super()
  end

  def rotate(degrees, direction="clockwise")

  end
end

class Square < RegularPolygon

end

class Triangle < RegularPolygon

end

