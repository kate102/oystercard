require 'oystercard'
describe Oystercard do
  let (:card) { Oystercard.new(10) }
  let (:station1) { double(:station1) }
  let (:station2) { double(:station2) }


# KM - Why is there a # sign here?
describe '#top_up' do

# KM - :top_up is a call to the top_up method that doesn't refer to the subject
# KM - Why doesn't that work for top_up with an argument?
  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ card.top_up 1 }.to change{ card.balance }.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAX_LIMIT
    expect{ card.top_up maximum_balance }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

end # top_up

describe '#deduct' do

  it 'deducts amount from balance' do
    expect{ card.deduct 1 }.to change{ card.balance }.by -1
  end

#  it 'raises an error if the maximum balance is exceeded' do
#    maximum_balance = Oystercard::MAX_LIMIT
#    card.top_up maximum_balance
#    expect{ card.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
#  end
end # deduct

describe '#in_journey?' do
# KM - {} for blocks and () for arguments
  it 'returns whether we are in a journey' do
    expect(card.in_journey?).to eq false 
  end
end # in_journey

describe '#touch_in' do
  it 'returns whether we are in a journey' do
    card2 = Oystercard.new
    card2.top_up(10)
    card2.touch_in(station1)
    expect( card2.in_journey?).to be true 
  end

  it 'fail if not enough credit' do
    card3 = Oystercard.new
    expect{ card3.touch_in(station1) }. to raise_error "Not enough credit"
  end

  it 'update entry_station after touch in' do 
    card.touch_in(station1)
    expect( card.entry_station ).to eq station1
  end
end # touch_in

describe '#touch_out' do
  it 'returns whether we are in a journey' do
    card.touch_out(station2)
    expect( card.in_journey?).to be false
  end

  it 'deducts £1 from balance' do
    expect{ card.touch_out(station2) }.to change{ card.balance }.by -1
  end
end # touch_out

describe '#minimum' do
  it 'returns the minimum balance' do
    expect( card.min_bal?).to be 1
  end
end # minimum

describe '#trips' do
  it 'returns the all of the trips' do
    card.touch_in(station1)
    card.touch_out(station2)
    expect(card.trips[0]).to eq([station1,station2])
  end
end # minimum

end
