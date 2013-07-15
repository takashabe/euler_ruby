=begin
1 から 5 までの数字を英単語で書けば one, two, three, four, five であり, 全部で 3 + 3 + 5 + 4 + 4 = 19 の文字が使われている.

では 1 から 1000 (one thousand) までの数字をすべて英単語で書けば, 全部で何文字になるか.

注: 空白文字やハイフンを数えないこと. 例えば, 342 (three hundred and forty-two) は 23 文字, 115 (one hundred and fifteen) は20文字と数える. なお, "and" を使用するのは英国の慣習.
=end


class Problem17
  def initialize()
    # 1の位
    @ones     = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
    # 10-19の特殊なやつら
    @ten_ones = {0 => "ten", 1 => "eleven", 2 => "twelve", 3 => "thirteen", 4 => "fourteen", 5 => "fifteen", 6 => "sixteen", 7 => "seventeen", 8 => "eighteen", 9 => "nineteen"}
    # 10の位 20-90
    @tens     = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}
    # 100の位
    @hundred  = "hundred"
    # 1000の位
    @thousand = "thousand"
  end

  def solve()
    res = ""
    (1..1000).each do |i|
      res += assemble(i)
    end

    p res.length
  end

  # assemble an alphanumeric character
  def assemble(i)
    res = ""

    case i
      when 1..9
        res = @ones[i]
      when 10..19
        mod = i.modulo(10)
        res = @ten_ones[mod]
      when 20..99
        div, mod = i.divmod(10)

        if mod == 0
          res = @tens[div]
        else
          res = @ones[mod] + @tens[div]
        end

      when 100..999
        # とり得る状態
        # 100 => one hundred, 101 => one hundred and one, 110 => one hundred and ten, 111 => one hundred and eleven, 121 => one hundred and twenty one

        # 1桁ずつに分割
        m = i.to_s
        m =~ /([0-9])([0-9])([0-9])/
        i100 = $~[1].to_i
        i10  = $~[2].to_i
        i1   = $~[3].to_i

        # 100の位
        res = @ones[i100] + @hundred

        # 10の位
        unless i10==0 && i1==0
          res += "and"
          # 10~19
          if i10==1
            res += @ten_ones[i1]
          else
            res += @tens[i10] unless i10==0
            res += @ones[i1] unless i1==0
          end
        end

      when 1000
        res = @ones[1] + @thousand
      else
        res = ""
    end

    p res
    res
  end
end

p = Problem17.new
p.solve()