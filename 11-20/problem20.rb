#Problem 20 「階乗の数字和」
#n × (n - 1) × ... × 3 × 2 × 1 を n! と表す.
#
#    例えば, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800 となる.
#    この数の各桁の合計は 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27 である.
#
#    では, 100! の各桁の数字の和を求めよ.

class Problem20
  def solve(n)
    fact = factorial(n)

    sum_digit = 0
    fact.to_s.each_char do |c|
      sum_digit += c.to_i
    end

    return sum_digit
  end

  def factorial(n)
    return n if n==1
    n * factorial(n-1)
  end
end

solve = Problem20.new
p solve.solve(100)