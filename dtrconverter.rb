class DTRConvertor
  def convert(dollar_amount)
    dollar_amount * 40.0 # Bug here
  end
end
m = DTRConvertor.new
puts m.convert(100.0)

def m.convert(dollar_amount)
  dollar_amount * 38.0
end

puts m.convert(100.0)