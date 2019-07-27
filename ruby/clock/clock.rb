class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + (minute / 60)) % 24
    @minute = minute % 60
  end

  def to_s
    "%02d:%02d" % [@hour, @minute]
  end

  def ==(other)
    @hour == other.hour and @minute == other.minute
  end

  def -(other)
    self.class.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def +(other)
    self.class.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end
end