class Acronym
  def self.abbreviate(name)
    name.scan(/\b\w/).join.upcase
  end
end