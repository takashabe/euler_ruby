class Problem1
  MAX = 1000
  M1 = 3
  M2 = 5
  sum = 0

  (0..MAX).each { |i|
    if(i % M1 == 0 || i % M2 == 0)
        sum += i
    end
  }

  p sum
end