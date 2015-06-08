module PicksHelper

#percentage helper method to find percentage based on 2 numbers  

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
      total.round(1)
    end
  end
end
