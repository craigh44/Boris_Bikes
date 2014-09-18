require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)	
	end

	def full_error_message
		'Van is full'
	end

	def deliver_to(garage)
		unavailable_bikes.each do |broken_bike|
		garage.dock(broken_bike)
		release(broken_bike)
		end
	end
		
	def deliver_to_station(station)
		available_bikes.each do |fixed_bike|
		station.dock(fixed_bike)
		release(fixed_bike)
	end
	
	def pick_up(station)
		station.unavailable_bikes.each do |broken_bike|
			station.release(broken_bike)
			dock(broken_bike)
		end
	end

	def pick_up_from_garage(garage)
		garage.available_bikes.each do |fixed_bikes|
			garage.release(fixed_bikes)
			dock(fixed_bikes)
		end
	end

	
end
end
