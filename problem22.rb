#Problem 22 「名前のスコア」 †
#5000個以上の名前が書かれている46Kのテキストファイル filenames.txt を用いる. まずアルファベット順にソートせよ.
#
#    のち, 各名前についてアルファベットに値を割り振り, リスト中の出現順の数と掛け合わせることで, 名前のスコアを計算する.
#
#    たとえば, リストがアルファベット順にソートされているとすると, COLINはリストの938番目にある. またCOLINは 3 + 15 + 12 + 9 + 14 = 53 という値を持つ. よってCOLINは 938 × 53 = 49714 というスコアを持つ.
#
#    ファイル中の全名前のスコアの合計を求めよ.

class Problem22
  def initialize()
    source = "files/names.txt"
    @file = File.open(source,"r")

    alphabets = ('A'..'Z').to_a
    numbers   = (1..26).to_a
    @symbols  = Hash[alphabets.zip(numbers)]
  end

  def solve()
    names = Array.new
    @file.each_line do |i|
      split_str = i.gsub("\"","")
      split_str = split_str.split(",")
      names << split_str
    end

    # 配列の平坦化
    names.flatten!

    # アルファベット順にソート
    names.sort!

    score = 0
    names.each_with_index do |v,k|
      score += get_score(v) * (k+1)
    end
    return score
  end

  def get_score(v)
    score = 0
    v.each_char do |i|
      score += @symbols[i].to_i
    end
    return score
  end
end

p = Problem22.new
p p.solve