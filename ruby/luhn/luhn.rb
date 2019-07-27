class Luhn
  def self.valid?(raw_card_number)
    raw_card_number.gsub(/\s/, '')
        .tap { |card_number| return false unless card_number.length > 1 and card_number[/\D/].nil? }
        .chars.reverse.map(&:to_i)
        .map.with_index { |digit, index| index.odd? ? digit * 2 : digit }
        .map { |digit| digit > 9 ? digit - 9 : digit }
        .sum % 10 == 0
  end
end