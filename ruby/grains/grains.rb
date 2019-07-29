class Grains
  def self.square(square_position)
    raise ArgumentError if square_position < 1 or square_position > 64
    2**(square_position - 1)
  end

  def self.total
    (1..64).map{|square_position| square(square_position)}.sum
  end
end