


Labels = {"f" => "Fahrenheit",
          "c" => "Celsius",
          "k" => "Kelvin",
          "r" => "Rankine"}

ConversionLabels = {"f2c" => [Labels['f'], Labels['c']],
                    "f2k" => [Labels['f'], Labels['k']],
                    "f2r" => [Labels['f'], Labels['r']],
                    "c2f" => [Labels['c'], Labels['f']],
                    "c2k" => [Labels['c'], Labels['k']],
                    "c2r" => [Labels['c'], Labels['r']],
                    "k2f" => [Labels['k'], Labels['f']],
                    "k2c" => [Labels['k'], Labels['c']],
                    "k2r" => [Labels['k'], Labels['r']],
                    "r2c" => [Labels['r'], Labels['c']],
                    "r2f" => [Labels['r'], Labels['f']],
                    "r2k" => [Labels['r'], Labels['k']]}

def complain(args)
  puts args
  exit
end


def check_range(degrees, scale)
  violated = false
  violation_string_base = "Degrees out of range, choose a number between"
  range_string = ""
  ranges = {"Fahrenheit" => [-459.67, 210.0],
            "Celsius" => [-273.15, 100.0],
            "Kelvin" => [0.15, 373.15],
            "Rankine" => []}

  if (degrees < ranges[scale][0]) or (degrees > ranges[scale][1])
    violated = true
    range_string = " %0.2f and %0.2f" % ranges[scale]
  end

  if violated
    puts violation_string_base + range_string + " for " + scale + "."
    complain "Out of Range Error, Exiting"
  end
end

def convert_from_fahrenheit_to_celsius(fdegrees)
  #check_range(fdegrees, "Fahrenheit")
  celsius = (fdegrees - 32.0) * (5.0/9.0)
end

def convert_from_fahrenheit_to_kelvin(fdegrees)
  kelvin = convert_from_fahrenheit_to_celsius(fdegrees) + 273.15
end

def convert_from_fahrenheit_to_rankine(fdegrees)
  rankine = fdegrees + 459.67
end

def convert_from_celsius_to_fahrenheit(cdegrees)
  #check_range(cdegrees, "Celsius")
  fahrenheit = (cdegrees * (9.0 / 5.0)) + 32.0
end

def convert_from_celsius_to_kelvin(cdegrees)
  #check_range(cdegrees, "Celsius")
  kelvin = cdegrees + 273.15
end

def convert_from_celsius_to_rankine(cdegrees)
  rankine = convert_from_celsius_to_kelvin(cdegrees) * (9.0/5.0)
end

def convert_from_kelvin_to_celsius(kdegrees)
  #check_range(kdegrees, "Kelvin")
  celsius = convert_from_celsius_to_fahrenheit(kdegrees - 273.15)
end

def convert_from_kelvin_to_rankine(kdegrees)
  rankine = kdegrees * (9.0/5.0)
end

def convert_from_kelvin_to_fahrenheit(kdegrees)
  cdegrees = convert_from_kelvin_to_celsius(kdegrees)
  kelvin = convert_from_celsius_to_fahrenheit(cdegrees)
end

def convert_from_rankine_to_celcius(rdegrees)
  #check_range(rdegrees, "Rankine")
  celcius = (rdegrees -491.67) * (9.0/5.0)
end

def convert_from_rankine_to_fahrenheit(rdegrees)
  #check_range(rdegrees, "Rankine")
  fahrenheit = rdegrees - 459.67
end

def convert_from_rankine_to_kelvin(rdegrees)
  #check_range(rdegrees, "Rankine")
  kelvin = rdegrees * (5.0/9.0)
end

ConversionMethods = {"f2c" => method(:convert_from_fahrenheit_to_celsius),
                     "f2k" => method(:convert_from_fahrenheit_to_kelvin),
                     "f2r" => method(:convert_from_fahrenheit_to_rankine),
                     "c2f" => method(:convert_from_celsius_to_fahrenheit),
                     "c2k" => method(:convert_from_celsius_to_kelvin),
                     "c2r" => method(:convert_from_celsius_to_rankine),
                     "k2f" => method(:convert_from_kelvin_to_fahrenheit),
                     "k2c" => method(:convert_from_kelvin_to_celsius),
                     "k2k" => method(:convert_from_kelvin_to_rankine),
                     "r2f" => method(:convert_from_rankine_to_fahrenheit),
                     "r2c" => method(:convert_from_rankine_to_celsius),
                     "r2k" => method(:convert_from_rankine_to_rankine)}

def execute_conversion(conversion_method, degrees)
  ConversionMethods[conversion_method].call(degrees)
end

def parse_input(input)
  tokens = input.split()
  conversion_method = tokens[0]
  original_degrees = tokens[1].to_f

  if ConversionLabels.keys.include?(tokens[0])
    [conversion_method, original_degrees]
  else
    puts "Unknown Parameters"
    exit
  end
end


puts <<END_INTRO

----------------------------------------------------
This is a temperature conversion program.
At the prompt type your conversion preference:

END_INTRO

commands = ConversionLabels.keys

commands.each do |k|
  puts "for %s to %s type: %s n" % [ConversionLabels[k][0], ConversionLabels[k][1], k]
end

puts "\nWhere \"n\" is the number you wish to convert."
puts "----------------------------------------------------"

print "Enter Conversion Options\n>>"

conversion_method, original_degrees = parse_input(gets.chomp())

check_range(original_degrees, ConversionLabels[conversion_method][0])

converted_degrees = execute_conversion(conversion_method, original_degrees)

pre_conversion_label, post_conversion_label = ConversionLabels[conversion_method]

puts "%.2f degrees %s is equal to %.2f degrees %s\n" % [original_degrees,
                                                           pre_conversion_label,
                                                           converted_degrees,
                                                           post_conversion_label]