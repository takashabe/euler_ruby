module Utils
  def is_prime(num)
    # 2は素数
    return true if num==2

    # 偶数排除
    return false if num%2 == 0

    # 試し割り(ダサい)
    (3..Math::sqrt(num)).each do |i|
      # 割り切れれば素数ではない
      return false if num%i == 0
    end

    true
  end
end