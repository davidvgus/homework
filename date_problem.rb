def pretty_date(date)
  x, y, z = date.split(/[ -\/]/)

  if x.to_i == 0
    d = Date.parse(date)
  elsif x.length > 2
    d = Date.parse(date)
  else
    d = Date.parse([z,y,x].join("-"))
  end

  d.strftime("%b %d, %Y")

end
