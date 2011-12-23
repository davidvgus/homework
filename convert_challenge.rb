


Labels = ["Fahrenheit", "Celcius", "Kelvin", "Rankine"]

ConversionLabels = {"f2c" => [Labels[0], Labels[1]], "c2f" => [Labels[1], Labels[0]]}

def complain(args)
  puts args
  exit
end


def check_range(degrees, scale)
  violated = false
  violation_string_base = "Degrees out of range, choose a number between"
  range_string = ""
  case scale
    when "Fahrenheit"
      if (degrees < -459.67) or (degrees > 210)
        violated = true
        range_string = " -459 and 210"
      end
    when "Celcius"
      if (degrees < -273.15) or (degrees > 100)
        violated = true
        range_string = " -273.15 and 100"
      end
  end

  if violated
    puts violation_string_base + range_string + " for " + scale + "."
    complain "Out of Range Error, Exiting"
  end
end

def convert_from_fahrenheit_to_celcius(fdegrees)
  check_range(fdegrees, "Fahrenheit")
  celcius = (fdegrees - 32.0) * (5.0/9.0)
end

def convert_from_celcius_to_fahrenheit(cdegrees)
  check_range(fdegrees, "Celcius")
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

puts "%.2f degrees %s is equal to %.2f degrees %s\n" % [original_degrees,
                                                           pre_conversion_label,
                                                           converted_degrees,
                                                           post_conversion_label]