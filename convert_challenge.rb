


Labels = ["Fahrenheit", "Celcius", "Kelvin", "Rankine"]

ConversionLabels = {"f2c" => [Labels[0], Labels[1]], "c2f" => [Labels[1], Labels[0]]}

def complain(args)
  puts args
  exit
end

def convert_from_fahrenheit_to_celcius(fdegrees)
  if (fdegrees < -459.67) or (fdegrees > 210)
    complain "Degrees out of range, choose a number between -459 and 210 for Fahrenheit"
  end
  celcius = (fdegrees - 32.0) * (5.0/9.0)
end

def convert_from_celcius_to_fahrenheit(cdegrees)
  if (cdegrees < -273.15) or (cdegrees > 100)
    complain "Degrees out of range, choose a number between -273.15 and 100 for Fahrenheit"
  end
  fahrenheit = (cdegrees * (9.0 / 5.0)) + 32.0
end

ConversionMethods = {"f2c" => method(:convert_from_fahrenheit_to_celcius),
                "c2f" => method(:convert_from_celcius_to_fahrenheit)}

def execute_conversion(conversion_method, degrees)
  ConversionMethods[conversion_method].call(degrees)
end

def parse_input(input)
  tokens = input.split()
  conversion_method = tokens[0]
  original_degrees = tokens[1].to_f

  if ['f2c', 'c2f'].include?(tokens[0])
    [conversion_method, original_degrees]
  else
    puts "Unknown Parameters"
    exit
  end
end


intro_string = <<END_INTRO

----------------------------------------------------
This is a temperature conversion program.
At the prompt first type your conversion preference:

For Fahrenheit to Celcius type: f2c  n

For Celcius to Fahrenheit type: c2f  n

Where "n" is the number you wish to convert.
----------------------------------------------------
END_INTRO

puts intro_string
print "Enter Conversion Options\n>>"

conversion_method, original_degrees = parse_input(gets.chomp())

converted_degrees = execute_conversion(conversion_method, original_degrees)

pre_conversion_label, post_conversion_label = ConversionLabels[conversion_method]

printf ("%.2f degrees %s is equal to %.2f degrees %s\n" % [original_degrees,
                                                           pre_conversion_label,
                                                           converted_degrees,
                                                           post_conversion_label])