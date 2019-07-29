class Complement
  COMPLEMENTS = {
      'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U',
  }.freeze

  def self.of_dna(strand)
    strand.chars.map{|nucleotide| COMPLEMENTS[nucleotide]}.join
  end
end