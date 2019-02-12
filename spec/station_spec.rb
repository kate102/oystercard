require './lib/station'


describe 'station' do
  let (:station) {Station.new}

  it 'has a name' do
    station.name
  end
  it 'has a zone' do
    station.zone
  end
end


