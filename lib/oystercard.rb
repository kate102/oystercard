class Oystercard

 attr_accessor :balance, :in_journey
 MAX_LIMIT = 90
 MIN_BAL   = 1

 def initialize( balance = 0)
    @balance = balance
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
   fail "Not enough credit" if @balance < MIN_BAL
   @in_journey = true
   print 'Touch In Successful'
 end

# KM - Not happy about this logic!
 def touch_out
   @in_journey = false
   print 'Touch Out Successful'
 end

 def min_bal?
   MIN_BAL
 end

end
