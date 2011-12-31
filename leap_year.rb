require 'win32console' if RUBY_PLATFORM =~ /mingw/

#learned from : https://github.com/Ramaze/ramaze/blob/master/lib/ramaze/helper/formatting.rb#L45-56

=begin
doctest: Test that format_num(1000000) outputs as string "1,000,000"
>> format_num(1000000)
=> "1,000,000"
doctest: Test that format_num(1) outputs as string "1"
>> format_num(1)
=> "1"
=end

def format_num(int)
  int.to_s.reverse.scan(/\d{1,3}/).reverse.join(",")
end

=begin
doctest: test divisible_by? with 2000 and 4
>> divisible_by?(2000, 4)
=> true
doctest: test divisible_by?  with 2001 4
>> divisible_by?(2001, 4)
=> false
=end

def divisible_by?(num, denominator)
    num % denominator == 0
end

=begin
doctest: First test will return false if no year was passed into the method
>> leap_year?()
=> false
doctest: test leap_year? on 2001
>> leap_year?(2001)
=> false
doctest: test leap_year? on 2004
>> leap_year?(2004)
=> true
doctest: test leap_year? on 2000
>> leap_year?(2000)
=> true
doctest: test leap_year? on 2400
>> leap_year?(2400)
=> true
doctest: test leap_year? on 2700
>> leap_year?(2700)
=> false
REMEMBER TO MAKE NEW TESTS
=end

#def leap_year?(year = nil)
#  if year.nil?
#    false
#  elsif year.is_a?(Fixnum) && year.to_s.length > 0
#    if divisible_by?(year, 400)
#      true
#    elsif !divisible_by?(year, 100) && divisible_by?(year, 4)
#      true
#    else
#      false
#    end
#  end
#end

def leap_year?(year = nil)
  return false if year.nil?
	divisible_by?(year, 400) || !divisible_by?(year, 100) && divisible_by?(year, 4)
end



MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24
DAYS_IN_YEAR = 365
DAYS_IN_LEAP_YEAR = 366

=begin
doctest: Test minutes_in_year on 1 year and leap_year == true
>> minutes_in_year(1, true)
=> 527040
doctest: Test minutes_in_year on 1 year and leap_year == false
>> minutes_in_year(1)
=> 525600
=end

def minutes_in_year(years, leap_year = false)
  if leap_year
    years * DAYS_IN_LEAP_YEAR * HOURS_IN_DAY * MINUTES_IN_HOUR
  else
    years * DAYS_IN_YEAR * HOURS_IN_DAY * MINUTES_IN_HOUR
  end
end





if __FILE__ == $0 then
=begin
calculate and display the number of minutes in a leap
year (2000 and 2004) and the number of minutes in a
non-leap year (1900 and 2005). Note: a century year,
like 1900 and 2000, is a leap year only if it is
divisible by 400.
=end


  years = [2000, 2004, 1900, 2005]
  years.each do |year|
    if leap_year?(year)
      puts "There are %s minutes in leap year %d" % [format_num(minutes_in_year(year, true)), year]
    else
      puts "There are %s minutes in %d" % [format_num(minutes_in_year(year)), year]
    end
  end
end