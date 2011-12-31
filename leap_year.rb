require 'win32console' if RUBY_PLATFORM =~ /mingw/

=begin
accept a year value from the user, check whether
it's a leap year, and then return true or false.
With the help of this leap_year?() method calculate
and display the number of minutes in a leap year
(2000 and 2004) and the number of minutes in a
non-leap year (1900 and 2005). Note: a century
year, like 1900 and 2000, is a leap year only if
it is divisible by 400.
=end

=begin
doctest: test divisible_by? with 2000 and 4
>> divisible_by?(2000, 4)
=> true
doctest: test divisible_by?  with 2001 4
>> divisible_by?(2001, 4)
=> false
=end

def divisible_by?(num = nil, denominator)
  if num % denominator == 0
    true
  else
    false
  end
end


=begin
doctest: First test will return nil if no year was passed into the method
>> leap_year?()
=> nil
doctest: test on 2001
>> leap_year?(2001)
=> false
doctest: test on 2004
>> leap_year?(2004)
=> true
doctest: test on 2000
>> leap_year?(2000)
=> true
doctest: test on 2400
>> leap_year?(2400)
=> true
REMEMBER TO MAKE NEW TESTS
=end




def leap_year?(year = nil)
  if year.nil?
    nil
  elsif year.is_a?(Fixnum) && year.to_s.length == 4
    if divisible_by?(year, 400)
      true
    elsif !divisible_by?(year, 100) && divisible_by?(year, 4)
      true
    else
      false
    end
  end
end
