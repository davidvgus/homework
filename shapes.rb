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
=end

class Shape
  def initialize(x,y, args = false)
    @position = Point.new(x, y)
    @heading_degrees = 0
    @points = []
    @sound_file = self.class.to_s.downcase << ".aif"
    if args
      unless self.class == Circle
       args[0].each_with_index { |point, i| @points << Point.new(point[0], point[1])}
      else
       @radius = args
      end
    end


  end

  def on_click
    rotate(360)
    play_sound
  end

  def position
    @position.point
  end

  def play_sound
    @sound_file
  end

  def rotate(degrees)
    @heading_degrees = (@heading_degrees + degrees) % 360
  end
end

class Circle < Shape
end

class Square < Shape
end

class Triangle < Shape
end

