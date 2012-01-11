require 'win32console' if RUBY_PLATFORM =~ /mingw/


class Dog
  attr_accessor :name, :learned_methods
  
  def initialize(name)
    @name = name
    @learned_methods = {}
  end

  def bark
    "#{@name} barks!"
  end

  def chase_cat
    "#{@name} runs around after that crafty feline."
  end

  def eat
    "chomp,chomp,chomp"
  end

=begin
doctest: Testing respond_to? failure
>> d = Dog.new("bob")
>> d.respond_to?("doesntexist")
=> false
doctest: Testing on a newly created method
>> d1 = Dog.new("bob")
>> d1.teach_trick(:yowl) { |dog| "#{dog.name} yowls!"}
>> d1.respond_to?("yowl")
=> true
doctest: Testing on preexisting method
>> d2 = Dog.new("bob")
>> d2.respond_to?("bark")
=> true
=end

def respond_to?(symbol, include_private = false)
   @learned_methods.keys.include?(symbol.to_sym) or super
end

=begin
doctest: Try to add a trick and then test it
>> d = Dog.new("bob")
>> d.teach_trick(:yowl) { |dog| "#{dog.name} yowls!"}
>> d.yowl
=> "bob yowls!"
doctest: Test to make sure that yowl fails before being taught
>> d2 = Dog.new("bill")
>> d2.yowl
=> "bill doesn't know how to yowl!"
=end

  def teach_trick(method, *args, &block)
    if method && block_given?
      @learned_methods[method] = lambda &block
    end
  end
  
  def method_missing(method, *args, &block)
    if @learned_methods.keys.include?(method.to_sym)
      @learned_methods[method.to_sym].call(self)
    else
      "#{@name} doesn't know how to #{method}!"
    end
  end
end