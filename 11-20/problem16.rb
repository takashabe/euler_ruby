=begin
  2^15 = 32768 であり, これの各桁の和は 3 + 2 + 7 + 6 + 8 = 26 となる.

  同様にして, 2^1000 の各桁の和を求めよ.
=end


class Problem16
  def solve(base, e)
    # べき乗の計算
    ans = 1
    e.times do
      ans *= base
    end

    # 各桁の和の計算
    sum = 0
    ans.to_s.each_char do |i|
      sum += i.to_i
    end

    sum
  end
end

p = Problem16.new
p p.solve(2, 1000)