=begin
最初の10個の自然数について, その二乗の和は,

12 + 22 + ... + 102 = 385
最初の10個の自然数について, その和の二乗は,

(1 + 2 + ... + 10)2 = 3025
これらの数の差は 3025 - 385 = 2640 となる.

同様にして, 最初の100個の自然数について二乗の和と和の二乗の差を求めよ.
=end

class Problem6
  def solve(num)
    if num <= 0
      raise ArgumentError, "Invalid argument: #{self}"
    end

    # 二乗の和
    squareSum = (1..num).map {|i|
      i * i
    }.inject(:+)

    # 和の二乗
    sumSquare = (1..num).inject(:+)
    (sumSquare * sumSquare) - squareSum
  end

  def main(arg)
    solve(arg)
  end
end

solve = Problem6.new
p solve.main(100)