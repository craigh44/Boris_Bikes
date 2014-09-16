require "../lib/bike_container"
require "../lib/bike"

class ContainHolder; include BikeContainer; end

describe BikeContainer do
	 let(:bike) {Bike.new}
	 let(:holder) {ContainHolder.new}

	 it "should accept  bike" do 
	 	expect(holder.bike_count).to eq(0)
	 	holder.dock(bike)
	 	expect(holder.bike_count).to eq(1)
	 end

end