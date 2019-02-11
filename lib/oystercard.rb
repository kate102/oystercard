class Oystercard

 attr_accessor :balance, :in_journey
 MAX_LIMIT = 90

 def initialize
    @balance = 0
    @in_journey = false
 end

 def top_up(amount)
   fail "Maximum balance of #{MAX_LIMIT} exceeded" if @balance + amount > MAX_LIMIT
   @balance += amount
 end

 def deduct(amount)
   # fail "Maximum balance of #{MAX_LIMIT} exceeded" if @balance + amount > MAX_LIMIT
   @balance -= amount
 end

 def in_journey?
   @in_journey 
 end

 def touch_in
   @in_journey = true
 end

 def touch_out
   !@in_journey = false
 end

end
