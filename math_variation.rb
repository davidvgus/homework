#Write an class for an object that will demonstrate
#direct and indirect variation given a constant k


class Variation
  attr_accessor :constant, :a, :b

  def initialize(constant)
    @constant = constant
  end

  def direct_v
    @b.to_f * @constant
  end

  def inverse_v
    @b.to_f / @constant
  end

end