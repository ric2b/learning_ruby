class Matrix
  attr_accessor :rows, :columns

  def initialize(matrix)
    @rows = matrix.each_line.map{|row| row.split.map(&:to_i)}
    @columns = @rows.transpose
  end
end