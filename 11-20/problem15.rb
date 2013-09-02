=begin
  2×2 のマス目の左上からスタートした場合, 引き返しなしで右下にいくルートは 6 つある.


  では, 20×20 のマス目ではいくつのルートがあるか.
=end


class Problem15
  # @param n 格子の数
  def solve(n)
    # n*2 combination n
    numerator = factional(n*2)
    denominator = factional(n)

    numerator / (denominator * denominator)
  end

  def factional(n)
    return n if n == 1

    n * factional(n-1)
  end
end

p = Problem15.new
p p.solve(20)