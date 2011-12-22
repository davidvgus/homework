age = 979000000.0

seconds_per_year = 31556926.0

age_in_years = age / seconds_per_year

formatted_age = Kernel.format("%.2f", age_in_years)

puts formatted_age