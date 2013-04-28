# 2520 は 1 から 10 の数字の全ての整数で割り切れる数字であり, そのような数字の中では最小の値である.
# では, 1 から 20 までの整数全てで割り切れる数字の中で最小の正の数はいくらになるか.

class Problem5
  # 割り切れるか検査
  def is_devisible(dividend, max_divisor)
    (1..max_divisor).each do |n|
      if !(dividend % n == 0)
        return false
      end
    end

    return true
  end


  def main(num)
    # 除数の最大値が0以下であれば終了
    if (num <= 0)
      return 0
    end

    # 最小公倍数
    ret = 1

    while(true)
      if is_devisible(ret, num)
        break
      end
      ret+=1
    end

    return ret
  end
end

p5 = Problem5.new
ret = p5.main(20)
p ret
