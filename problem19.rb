#次の情報が与えられている.
#
#    1900年1月1日は月曜日である.
#    9月, 4月, 6月, 11月は30日まであり, 2月を除く他の月は31日まである.
#    2月は28日まであるが, うるう年のときは29日である.
#    うるう年は西暦が4で割り切れる年に起こる. しかし, 西暦が400で割り切れず100で割り切れる年はうるう年でない.
#    20世紀（1901年1月1日から2000年12月31日）中に月の初めが日曜日になるのは何回あるか?

class Problem19
  def initialize()
    @month_normal = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    @month_leap   = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end

  def solve()
    lapsed_days = 0
    cnt_sundays = 0

    # 1990年
    @month_normal.each do |i|
      lapsed_days += i
    end
    cnt_sundays += 1 if is_first_sunday(lapsed_days)

    # 1991〜2000年
    (1901..2000).each do |year|
      months = get_months(year)
      months.each do |month|
        lapsed_days += month
        cnt_sundays += 1 if is_first_sunday(lapsed_days)
      end
    end
    return cnt_sundays
  end

  def is_leap_year(year)
    if year % 400 == 0
      return false if (year % 400 != 0) && (year % 100 == 0)
      return true
    end
    return false
  end

  def get_months(year)
    if is_leap_year(year)
      return @month_leap
    else
      return @month_normal
    end
  end

  def is_first_sunday(lapsed_days)
    return lapsed_days % 7 == 0
  end
end

solve = Problem19.new
p solve.solve
