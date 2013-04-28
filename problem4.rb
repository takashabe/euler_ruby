=begin
  左右どちらから読んでも同じ値になる数を回文数という. 2桁の数の積で表される回文数のうち, 最大のものは 9009 = 91 × 99 である.
  では, 3桁の数の積で表される回文数のうち最大のものを求めよ.
=end

class Problem4
  # 数値が回文数かどうかを調べる
  def is_palindromic(src)
    palindromic = src.to_s
    parseNum = self.reverse(palindromic)
    palindromic == parseNum
  end

  # 数値を反転して返す
  def reverse(src)
    # 文字列を1文字ずつの配列に分割する
    chars = src.split("")

    # 反転した配列を求める
    result = Array.new()
    chars.each do |c|
      result.unshift(c)
    end

    # 配列を文字列に結合した上で返す
    result.join
  end

  def main()
    # 回文数のリスト
    palindromics = Array.new

    # 3桁同士の乗算によって得られる回文数を求める
    999.downto(100) {|i|
      999.downto(100) { |j|

        result = is_palindromic(i*j)
        if(result)
          palindromics << i*j
        end
      }
    }

    palindromics.max
  end
end

p4 = Problem4.new
p p4.main