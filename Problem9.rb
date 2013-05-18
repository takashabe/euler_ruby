=begin
ピタゴラス数(ピタゴラスの定理を満たす自然数)とは a < b < c で以下の式を満たす数の組である.

    a2 + b2 = c2
例えば, 32 + 42 = 9 + 16 = 25 = 52 である.

    a + b + c = 1000 となるピタゴラスの三つ組が一つだけ存在する.
    これらの積 abc を計算しなさい.
=end

class Problem9
  def solve(num)
    (1..998).each do |a|
      (2..999).each do |b|
        next if a > b

        # ピタゴラス数判定
        a = 3
        b = 4
        c = a + b
        p 'ピタゴラス数'
        # 命題判定
        if a + b + c == num
          return a*b*c
        end
      end
    end

  end
end

p = Problem9.new
p p.solve(1000)
