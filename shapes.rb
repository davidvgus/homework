require 'win32console' if RUBY_PLATFORM =~ /mingw/

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
doctest: Test rotate_over_time
>> shape2 = Shape.new(10,10)
>> shape2.rotate_over_time(5,1000) {|deg, mil| puts "#{deg}, #{mil}"; sleep mil}
=> 1, 0.2
=> 2, 0.2
=> 3, 0.2
=> 4, 0.2
=> 5, 0.2
=> 5
=end

class Shape
  attr_accessor :position, :heading_degrees
  def initialize(x,y)
    @position = Point.new(x, y)
    @heading_degrees = 0
  end

  def position
    @position.point
  end

  def play_sound(sound_file = 'default.aif')
    puts sound_file
  end

  def rotate(degrees)
    @heading_degrees = (@heading_degrees + degrees) % 360
  end

  def rotate_over_time(degrees, milliseconds, &block)
    milliseconds_per_degree = milliseconds / degrees.to_f
    degrees.times do
      yield [@heading_degrees = (@heading_degrees + 1) % 360, milliseconds_per_degree / 1000.0 ]
    end
  end
end

class RegularPolygon < Shape
  def initialize(x, y, points)
    #points is an array of Points tha represent the triangles vertexes
    @points = points.each do |point|
      Point.new(point[0], point[1])
    end
    super(x,y)
  end
end

class Circle < Shape
  def initialize(x, y, radius)
    @circle_sound = "circle.aif"
    @radius = radius
    super(x,y)
  end

  def play_sound
    super(@circle_sound)
  end

end

class Square < RegularPolygon
  def initialize(x, y, points, side_length)
    @square_sound = "square.aif"
    super(x, y, side_length)
  end

  def play_sound
    super(@circle_sound)
  end
end

class Triangle < RegularPolygon
  def initialize(x, y, points, side_length)
    @triangle_sound = "triangle.aif"
    #points is an array of Points tha represent the triangles vertexes
    @points = points
    super(x, y, points)
  end

  def play_sound
    super(@triangle_sound)
  end
end

