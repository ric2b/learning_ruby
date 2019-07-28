class Tournament
  def self.tally(input)
    results = Hash.new { |this, key| this[key] = {:played => 0, :wins => 0, :losses => 0, :draws => 0, :points => 0} }

    input.each_line
        .map { |line| line.rstrip.split(';') }
        .reject(&:empty?)
        .each do |team1, team2, result|
          results[team1][:played] += 1
          results[team2][:played] += 1

          case result
            when 'win'
              results[team1][:wins] += 1
              results[team1][:points] += 3
              results[team2][:losses] += 1
            when 'loss'
              results[team1][:losses] += 1
              results[team2][:wins] += 1
              results[team2][:points] += 3
            when 'draw'
              results[team1][:draws] += 1
              results[team1][:points] += 1
              results[team2][:draws] += 1
              results[team2][:points] += 1
          else
            raise ArgumentError.new "Unknown result: #{result}"
          end
    end

    tally = "Team                           | MP |  W |  D |  L |  P\n"
    unless results.empty?
      tally += results.each_pair
          .sort_by { |team, result| [-result[:points], team] }
          .map { |team, result| "%-30{team} | %2{played} | %2{wins} | %2{draws} | %2{losses} | %2{points}\n" % {:team => team}.merge(result) }
          .join
    end
    tally
  end
end