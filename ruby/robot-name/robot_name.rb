require 'set'

class Robot
  attr_reader :name

  @@available_names =('AA000'..'ZZ999').to_a

  def initialize
    reset
  end

  def reset
    @name = @@available_names.pop
  end

  def self.forget
    @@available_names = ('AA000'..'ZZ999').to_a
  end
end