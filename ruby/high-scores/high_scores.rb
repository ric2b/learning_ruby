class HighScores
  attr_accessor :scores, :latest, :personal_top_three, :personal_best

  def initialize(scores = [])
    @scores = scores
    @latest = scores.last
    @personal_top_three = scores.sort.reverse.first 3
    @personal_best = @personal_top_three.first
  end
end