=begin
以下の三角形の頂点から下まで移動するとき, その数値の和の最大値は23になる.

3
7 4
2 4 6
8 5 9 3
この例では 3 + 7 + 4 + 9 = 23.

以下の三角形を頂点から下まで移動するとき, その最大の和を求めよ.

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
注: ここではたかだか 16384 通りのルートしかないので, すべてのパターンを試すこともできる. Problem 67 は同じ問題だが100行あるので, 総当りでは解けない. もっと賢い方法が必要である.
=end

class Problem18
  def initialize()
    source = self::get_source
    @source_list = Array.new

    source.split("\n").each do |i|
      @source_list << i.split(" ")
    end
  end

  def get_source
    <<-EOS
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
    EOS
  end

  def solve()
    # 元の三角形取得
    sources = @source_list
    max = nil

    loop do
      break if sources.length==0

      # 末尾を取得
      last_array = sources.pop

      # 最大値の更新
      max = last_array

      # 要素が存在すれば末尾の配列を加算
      unless sources.length==0
        add_array = sources.pop

        # 加算後の配列を設定
        sources.push(add_merge(last_array, add_array))
      end
    end

    return max
  end

  # 下段同士の加算
  def add_merge(src, desc)
    # 最大値を取るように加算を行う
    result_list = Array.new

    desc.each_with_index do |v, i|
      # 加算値取得
      add_value = max(src[i].to_i, src[i+1].to_i)

      result_list[i] = v.to_i + add_value
    end

    return result_list
  end

  def max(x, y)
    if x > y
      return x
    else
      return y
    end
  end
end

p = Problem18.new
p p.solve()