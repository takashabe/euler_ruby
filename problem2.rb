#フィボナッチ数列の項は前の2つの項の和である. 最初の2項を 1, 2 とすれば, 最初の10項は以下の通りである.
#
#    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#    数列の項の値が400万を超えない範囲で, 偶数値の項の総和を求めよ.

class Problem2
  def sieve()
    num1 = 1
    num2 = 2
    fib  = 0
    total = num2

    while(fib < 4000000)
      fib = num1 + num2
      num1 = num2
      num2 = fib

      if(fib % 2 == 0)
        total += fib
      else
        next
      end
    end
    p "total = #{total}"
  end

end

obj = Problem2.new()
obj.sieve