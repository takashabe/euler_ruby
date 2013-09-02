=begin
10以下の素数の和は 2 + 3 + 5 + 7 = 17 である.

    200万以下の全ての素数の和を求めよ.
=end

class Problem10
  def solve(max)
    # 素数の和
    sum = 0

    # maxまで素数を回す
    max.times {|i|
      # 素数判定
      if is_prime(i)
        sum += i
      end
    }

    sum
  end

  def is_prime(num)
    # お約束
    return false if num==1
    return true if num==2

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

p = Problem10.new
p p.solve(2000000)