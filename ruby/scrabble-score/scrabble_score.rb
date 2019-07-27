class Scrabble
  attr_reader :score

  LETTER_VALUES = Hash.new(0)
  %w(A E I O U L N R S T).each { |x| LETTER_VALUES[x] = 1 }
  %w(D G).each { |x| LETTER_VALUES[x] = 2 }
  %w(B C M P).each { |x| LETTER_VALUES[x] = 3 }
  %w(F H V W Y).each { |x| LETTER_VALUES[x] = 4 }
  %w(K).each { |x| LETTER_VALUES[x] = 5 }
  %w(J X).each { |x| LETTER_VALUES[x] = 8 }
  %w(Q Z).each { |x| LETTER_VALUES[x] = 10 }
  LETTER_VALUES.freeze

  def initialize(word)
    @score = self.class.score(word)
  end

  def self.score(word)
    return 0 if word.nil?
    word.chars.map{ |letter| LETTER_VALUES[letter.upcase] }.sum
  end
end