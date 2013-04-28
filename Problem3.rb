class Problem3
  require "prime"

  def sieve(dividend)
    primes  = Prime.instance
    era = Prime::EratosthenesGenerator.new
    divisor = era.next
    factors = []

    while !primes.prime?(dividend)
      if(dividend % divisor == 0)
        dividend /= divisor
        factors << divisor
      else
        divisor = era.next
      end
    end

    # dividendを割った最後の余剰は素数なのでfactorsに追加する
    factors << dividend

    p factors[factors.size - 1]
  end
end

p3 = Problem3.new
p3.sieve(600851475143)
