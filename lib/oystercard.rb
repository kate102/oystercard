class Oystercard

 attr_accessor :balance, :entry_station, :exit_station, :trips , :trip
 MAX_LIMIT = 90
 MIN_BAL   = 1

 def initialize( balance = 0)
    @balance = balance
    @trip = []
    @trips = []
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
   @entry_station != nil
 end

 def touch_in(station)
   @trip[0] = station
   fail "Not enough credit" if @balance < MIN_BAL
   print 'Touch In Successful'
   @entry_station = station
   @exit_station = nil
 end

# KM - Not happy about this logic!
 def touch_out(station)
   @trip << station
   @trips << @trip  
   @balance -= 1
   print 'Touch Out Successful'
   @entry_station = nil
   @exit_station = station
 end

 def min_bal?
   MIN_BAL
 end

end
