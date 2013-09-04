#Problem 21 「友愛数」
#d(n) を n の真の約数の和と定義する. (真の約数とは n 以外の約数のことである. )
#もし, d(a) = b かつ d(b) = a (a ≠ b のとき) を満たすとき, a と b は友愛数(親和数)であるという.
#
#    例えば, 220 の約数は 1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110 なので d(220) = 284 である.
#    また, 284 の約数は 1, 2, 4, 71, 142 なので d(284) = 220 である.
#
#    それでは10000未満の友愛数の和を求めよ.

class Problem21
  def solve(n)
    amicable_numbers = Array.new
    (1..n).each do |i|
      amicable_1 = sum_div(i)
      amicable_2 = sum_div(amicable_1)
      if amicable_2==i && amicable_1!=amicable_2
        amicable_numbers << amicable_2
        amicable_numbers << i
      end
    end

    sum_amicable = 0
    amicable_numbers.uniq.each do |i|
      sum_amicable += i
    end

    return sum_amicable
  end

  # 約数の和を求める
  def sum_div(n)
    sum_div = 0
    (1..n/2).each do |i|
      if n % i == 0
        sum_div += i
      end
    end
    return sum_div
  end
end

s = Problem21.new
p s.solve(10000)