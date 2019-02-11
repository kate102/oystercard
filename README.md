
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
card.touch_in == true
card.in_journey? == true
card.touch_out == true
card.in_journey? == false


