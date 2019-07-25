#!/usr/bin/env ruby

def hi(name = 'World')
  puts "Hello #{name.capitalize}!"
end

hi "ricardo"

class Greeter
  attr_accessor :name

  def initialize(name = 'World')
    @name = name
  end

  def say_hi
    puts "Hi #{@name.capitalize}!"
  end

  def say_bye
    puts "Bye #{@name.capitalize}, come back soon."
  end
end

greeter = Greeter.new("rita")

greeter.say_hi

greeter.say_bye

puts greeter.name

greeter.name = 'ricardo'

puts greeter.name