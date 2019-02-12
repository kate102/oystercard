
In order to use public transport
As a customer
I want money on my card
card = Oystercard.new
card.balance => 0

In order to keep using public transport
As a customer
I want to add money to my card
card = Oystercard.new
card.top_up(10) => new balance

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
card = Oystercard.new
card.top_up(91) => "Max balance exceeded"

In order to pay for my journey
As a customer
I need my fare deducted from my card
card = Oystercard.new
card.deduct(10) => balance - 10

In order to get through the barriers.
As a customer
I need to touch in and out.
card = Oystercard.new
card.in_journey? == false
card.touch_in == 'Touch In Successful'
card.in_journey? == true
card.touch_out == 'Touch Out Successful'
card.in_journey? == false

In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
card = Oystercard.new
card.touch_in == 'Not enough credit'
card.min_bal? == 1

In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
card.touch_out
card.balance == 9

In order to pay for my journey
As a customer
I need to know where I've travelled from
card.touch_in
card.origin == 'Camden'

In order to know where I have been
As a customer
I want to see all my previous trips
card.trips == 


