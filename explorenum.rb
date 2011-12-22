

fixn = 9
bign = 0
n = 0

while n != nil
  if n.class == Fixnum
    fixn = n
    puts "fixn " + fixn.to_s + ' ' + fixn.class.to_s
  elsif n.class == Bignum
    bign = n
    puts "Bigbign" + bign.to_s + ' ' + bign.class.to_s
  else
    return
  end

  n += 100000
  
end