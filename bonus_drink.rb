class BonusDrink
  @@per_bonus = 3
  def self.total_count_for(amount)
    if amount < 0 then
      0
    else
      amount + calc_bonus(amount)
    end
  end

  def self.calc_bonus(amount, total_bonus = 0)
    bonus = amount / @@per_bonus
    remaining = amount % @@per_bonus

    if bonus == 0 then
      total_bonus
    else
      total_bonus += bonus
      self.calc_bonus( bonus + remaining, total_bonus )
    end
  end
end

puts "購入する本数を入力してください"
amount = gets.chomp.to_i
puts "飲める本数は#{BonusDrink.total_count_for(amount)}本です"