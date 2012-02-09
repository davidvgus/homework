#convert.rb

#converts degrees Fahrenheit to degrees Celcius
def convert(fdegrees)
  celcius = (fdegrees.to_f - 32.0) * (5.0/9.0)
end

print "Enter Temperature in Fahrenheit\n>>"

input = gets.chomp()

#taken from Natasha Murashev solution
degrees_celcius = convert(input)

printf ("#{input} degrees Fahrenheit is equal to %.2f degrees Celcius\n" % degrees_celcius)
