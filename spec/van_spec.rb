require "bike_container"
require "bike"
require "van"



describe Van do

let(:van) { Van.new(:capacity => 10) }
let(:bike) {Bike.new}
let(:station) {DockingStation.new}
let(:garage) {Garage.new}

	it "should allow to set a default capacity on initialization" do
		expect(van.capacity).to eq(10)
 	end

 	it "should be able to deliver to the docking station" do 
 		van.dock(bike)
 		van.deliver_to_station station
 		expect(van.bike_count).to eq(0)
 		expect(station.bike_count).to eq(1)
 	end

	it "should be able to pick up bikes from docking station" do
 		bike.break!
 		station.dock(bike)
 		van.pick_up station
 		expect(van.bike_count).to eq(1)
 		expect(station.bike_count).to eq(0)
 	end

 	it "should be able to deliver bikes from van to the garage" do
 		bike.break!
 		van.dock(bike)
 		van.deliver_to garage
 		expect(van.bike_count).to eq(0)
 		expect(garage.bike_count).to eq(1)
 	end

 	 it "should be able to pick up bikes from garage" do
 	 	garage.dock(bike)
 	 	van.pick_up_from_garage garage
 	 	expect(garage.bike_count).to eq(0)
 	 	expect(van.bike_count).to eq(1)
 	 end

 	it "should raise error if van full" do 
 		10.times { van.dock(bike) }
    	expect(lambda { van.dock(bike) }).to raise_error("Van is full")
 	end




end