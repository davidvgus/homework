class IndiffHash 
 
  def self.[](*values)
   self.new(values)
  end

  def initialize(values = [])
    @hash = Hash[*values]
    @hash = @hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
  end

  def [](index)
    @hash[index.to_sym]
  end

  def []=(index, value)
    @hash[index.to_sym] = value
  end

end
