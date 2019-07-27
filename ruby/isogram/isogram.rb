require 'set'

class Isogram
  def self.isogram?(input)
    letters = input.downcase.chars - [' ', '-']
    letters == letters.uniq
  end
end