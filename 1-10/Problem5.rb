=begin
2520 は 1 から 10 の数字の全ての整数で割り切れる数字であり, そのような数字の中では最小の値である.
では, 1 から 20 までの整数全てで割り切れる数字の中で最小の正の数はいくらになるか.
=end

class Problem5
  # 割り切れるか検査
  def is_devisible(dividend, max_divisor)
    (1..max_divisor).each do |n|
      if !dividend % n == 0
        return false
      end
    end

    true
  end

  def main(num)
    # 除数の最大値が0以下であれば終了
    if num <= 0
      return 0
    end

    # 最小公倍数
    ret = 1

    while true
      if is_devisible(ret, num)
        break
      end
      ret+=1
    end

    ret
  end
end

class Problem5_2
  # 最大公約数を求める
  # ユークリッドの互除法 http://ja.wikipedia.org/wiki/%E3%83%A6%E3%83%BC%E3%82%AF%E3%83%AA%E3%83%83%E3%83%89%E3%81%AE%E4%BA%92%E9%99%A4%E6%B3%95
  def gcm(m, n)
    # 終了判定
    if n == 0
      return m
    end

    gcm(n, m % n)
  end

  # 最小公倍数を求める
  def lcm(m, n)
    if m < n
      lcm(n, m)
    end

    m*n / gcm(m, n)
  end

  def solve(max)
    if max == 2
      return lcm(2, 1)
    end

    lcm(solve(max - 1), max)
  end

  def main(num)
    solve(num)
  end
end

p5 = Problem5_2.new
p p5.main(20)