=begin
  正の整数に以下の式で繰り返し生成する数列を定義する.

  n → n/2 (n が偶数)

  n → 3n + 1 (n が奇数)

  13からはじめるとこの数列は以下のようになる.

  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
  13から1まで10個の項になる. この数列はどのような数字からはじめても最終的には 1 になると考えられているが, まだそのことは証明されていない(コラッツ問題)

  さて, 100万未満の数字の中でどの数字からはじめれば最長の数列を生成するか.

  注意: 数列の途中で100万以上になってもよい
=end


class Problem14
  def initialize
    @buckets = [1]
    @collatz_seq = {"max" => 0, "seed" => 0}
  end

  def solve(n)
    (1..n).each do |i|
      print([i])
      # コラッツ数列の長さを求める
      len = collatz(i)

      if len > @collatz_seq["max"]
        @collatz_seq["max"]  = len
        @collatz_seq["seed"] = i
      end

      print("\n")
    end

    @collatz_seq
  end

  # コラッツ数列の計算
  def collatz(n, len=0)
    print(n.to_s << ", ")
    len+=1

    return len if n==1

    if n % 2 == 0
      n = n/2
      collatz(n, len)
    else
      n = (n*3) + 1
      collatz(n, len)
    end
  end
end

p = Problem14.new
p p.solve(1000000)