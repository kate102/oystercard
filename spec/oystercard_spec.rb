require 'oystercard'
describe Oystercard do

   it 'it is created with balance of zero' do
    expect(subject.balance).to eq(0)
  end

#   it 'it should top up the balance' do
#    expect(subject.top_up(10)).to eq true
#  end

describe '#top_up' do

 it { is_expected.to respond_to(:top_up).with(1).argument }

 it 'can top up the balance' do
   expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
 end

end
end
