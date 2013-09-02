=begin
素数を小さい方から6つ並べると 2, 3, 5, 7, 11, 13 であり, 6番目の素数は 13 である.

10 001 番目の素数を求めよ.
=end

class Problem7
  # @param num: 求める素数の番号
  def solve(max)
    if max <= 0
      raise InvalidArgumentError, "Invalid Argument"
    end

    # 素数出現番号. 2だけは最初から計上しておく
    cnt = 1

    # 素数判定を試行する数
    num = 3

    while true
      # 素数判定
      if is_prime(num)
        p "cnt=#{cnt}, prime=#{num}"
        cnt+=1

        # 目的の素数が発見出来れば終了
        return num if cnt==max
      end

      num+=1
    end
  end

  def is_prime(num)
    # 偶数排除
    return false if num%2 == 0

    # 試し割り(ダサい)
    (3..Math::sqrt(num)).each do |i|
      # 割り切れれば素数ではない
      return false if num%i == 0
    end

    true
  end
end

solve = Problem7.new
p solve.solve(10001)