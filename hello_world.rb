#!/usr/bin/env ruby

# comments!
def hi(name = 'World')
  puts "Hello #{name.capitalize}!"
end

hi "ricardo"

class MegaGreeter
  attr_accessor :names

  def initialize(names = 'World')
    @names = names
  end

  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?"each"
      @names.each do |name|  # lambda!
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}"
    end
  end

  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end
end


# if __name__ == '__main__'
if __FILE__ == $0
  greeter = MegaGreeter.new("rita")

  greeter.say_hi

  greeter.say_bye

  puts greeter.names

  greeter.names = 'ricardo'

  puts greeter.names
end
