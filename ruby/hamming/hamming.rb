class Hamming
  def self.compute(string_a, string_b)
    raise ArgumentError if string_a.length != string_b.length
    string_a.chars.zip(string_b.chars).map{|a, b| a != b ? 1 : 0}.sum
  end
end