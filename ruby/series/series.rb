class Series
  def initialize(series)
    @series = series
  end

  def slices(n)
    if n > @series.length
      raise ArgumentError
    end

    (0..@series.length)
        .map{|i| @series.slice(i, n)}
        .select {|slice| slice.length == n}
  end
end