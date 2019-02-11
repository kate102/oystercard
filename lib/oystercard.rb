class Oystercard

 attr_accessor :balance
 MAX_LIMIT = 90

 def initialize
    @balance = 0
 end

 def top_up(amount)
   fail "Maximum balance of #{MAX_LIMIT} exceeded" if @balance + amount > MAX_LIMIT
   @balance += amount
 end

 def deduct(amount)
   # fail "Maximum balance of #{MAX_LIMIT} exceeded" if @balance + amount > MAX_LIMIT
   @balance -= amount
 end
end
