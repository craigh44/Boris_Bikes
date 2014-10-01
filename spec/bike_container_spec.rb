require 'bike_container'


class ContainerHolder; include BikeContainer; end

describe BikeContainer do

  let(:bike)    { double :bike, :class => Bike }
  let(:station) { double :station, :class => DockingStation}
  let(:holder)  { ContainerHolder.new } 


  it "should accept a bike" do        
    expect{holder.dock(bike)}.to change{holder.bike_count}.by 1    
  end

  it "should not release a bike if it is empty" do
    expect(holder.bike_count).to eq(0)
    expect(holder.release(bike)).to eq nil
  end

  it 'can only accept a bike' do
    expect{holder.dock(:bike)}.to raise_error 'That is not a bike'
  end

  it "can only release a bike" do 
    expect{holder.release(:bike)}.to raise_error 'You can only release a bike'
  end

  it "should provide a list of available bikes" do 
    working_bike, broken_bike = Bike.new, Bike.new    
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it "should provide a list of unavailable bikes" do 
    working_bike, broken_bike = Bike.new, Bike.new    
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.unavailable_bikes).to eq([broken_bike])
  end

end