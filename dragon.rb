
class Dragon
  include Comparable

  def initialize(dragon_type)
    @dragon_type = dragon_type
    @dragon_values = {:green => 0, :blue => 1, :red => 2, :gold => 3}
  end

  def to_i
    @dragon_values[@dragon_type].to_i
  end

  def <=>(other)
    self.to_i <=> other.to_i 
  end

  def dragons
    @dragon_values
  end
end
