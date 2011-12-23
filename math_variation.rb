#Write an class for an object that will demonstrate
#direct and indirect variation given a constant k


class Variation
  attr_accessor :constant, :a, :b

  def initialize(constant)
    @constant = constant
  end

  def direct_v(b)
    b.to_f * @constant.to_f
  end

  def inverse_v(b)
    @constant.to_f / b.to_f
  end

end