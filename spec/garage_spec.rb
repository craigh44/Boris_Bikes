require "bike"
require "garage"

describe Garage do 

	let(:garage) {Garage.new(:capacity => 44)}
	let(:bike) {Bike.new}

	it "should be able to set default capacity on initializing" do
		expect(garage.capacity).to eq(44)
	end
	
	it "should fix bikes as it recieves them" do 
		
	end

end