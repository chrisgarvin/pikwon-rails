module PicksHelper
  def percentage(num1, num2)
    if num1 == 0 && num2 == 0
      num1
    elsif num1 == 0
      total = 0
      total
    elsif num2 == 0
      total = 100
      total
    else
      total = num1 + num2
      total = num1.to_f / total
      total = total * 100
      total.round
    end
  end
end
