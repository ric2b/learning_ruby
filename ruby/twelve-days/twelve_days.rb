class TwelveDays
  def self.song
    day_presents = [
        ['first', 'a Partridge in a Pear Tree.'],
        ['second', 'two Turtle Doves, and'],
        ['third', 'three French Hens,'],
        ['fourth', 'four Calling Birds,'],
        ['fifth', 'five Gold Rings,'],
        ['sixth', 'six Geese-a-Laying,'],
        ['seventh', 'seven Swans-a-Swimming,'],
        ['eighth', 'eight Maids-a-Milking,'],
        ['ninth', 'nine Ladies Dancing,'],
        ['tenth', 'ten Lords-a-Leaping,'],
        ['eleventh', 'eleven Pipers Piping,'],
        ['twelfth', 'twelve Drummers Drumming,'],
    ]

    total_presents = ""
    output = []
    day_presents.each do |day_present|
      total_presents = " #{day_present[1]}#{total_presents}"
      output.append "On the #{day_present[0]} day of Christmas my true love gave to me:#{total_presents}"
    end

    output.join("\n\n") + "\n"
  end
end