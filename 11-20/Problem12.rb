=begin
三角数の数列は自然数の和で表わされ, 7番目の三角数は 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28 である. 三角数の最初の10項は:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
となる.

最初の7項について, その約数を列挙すると, 以下のとおり.

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28

これから, 7番目の三角数である28は, 6個以上の約数をもつ最初の三角数であることが分かる.

では, 500個以上の約数をもつ最初の三角数はいくつか.
=end

class Problem12
  def solve(n)
    (1..Float::INFINITY).each do |i|
      tri_number = get_triangular_number(i)
      divisors = get_divisors(tri_number, tri_number)
      p tri_number
      p divisors
      return tri_number if divisors >= n
    end
  end

  # get divisors list
  def get_divisors(n, target_div)
    divisors = Array.new
    sqrt_div = Math.sqrt(target_div)

    # divisor list of [n] is a number to be divisible with natural number from (1 to √n) * 2.
    (1..sqrt_div).each do |i|
      divisors << i if (n % i) == 0
    end

    divisors.size * 2
  end

  # calc triangular number
  # e.g. Triangular numbers 6 is the sum of natural number to triangular bottom 3.
  def get_triangular_number(base)
    tri_number = 0
    (1..base).each do |i|
      tri_number += i
    end
    tri_number
  end
end

solve = Problem12.new
p solve.solve(500)