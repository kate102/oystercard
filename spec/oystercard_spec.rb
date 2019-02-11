require 'oystercard'
describe Oystercard do

# KM - subject is an instance of the class object
   it 'it is created with balance of zero' do
    expect(subject.balance).to eq(0)
  end

#   it 'it should top up the balance' do
#    expect(subject.top_up(10)).to eq true
#  end

# KM - Why is there a # sign here?
describe '#top_up' do

# KM - :top_up is a call to the top_up method that doesn't refer to the subject
# KM - Why doesn't that work for top_up with an argument?
  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAX_LIMIT
    subject.top_up maximum_balance
    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

end # top_up

describe '#deduct' do

  it 'deducts amount from balance' do
    expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
  end

#  it 'raises an error if the maximum balance is exceeded' do
#    maximum_balance = Oystercard::MAX_LIMIT
#    subject.top_up maximum_balance
#    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
#  end
end # deduct

describe '#in_journey?' do
# KM - {} for blocks and () for arguments
  it 'returns whether we are in a journey' do
    expect(subject.in_journey?).to eq false 
  end
end # in_journey

describe '#touch_in' do
  it 'returns whether we are in a journey' do
    # expect(subject.touch_in).to eq true 
    subject.touch_in
    expect( subject.in_journey?).to eq true 
  end
end # touch_in

describe '#touch_out' do
  it 'returns whether we are in a journey' do
    # expect(subject.touch_out).to eq false 
    subject.touch_out
    expect( subject.in_journey?).to eq false 
  end
end # touch_in

end
