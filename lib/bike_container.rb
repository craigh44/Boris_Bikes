module BikeContainer

  DEFAULT_CAPACITY = 10


  def full_error_message
    'Station is full'
  end
  
  def bikes
    @bikes ||= []
  end

  def capacity    
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)    
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise full_error_message if full?
    raise "That is not a bike" unless bike.class == Bike
    bikes << bike
  end

  def release(bike)
    raise "You can only release a bike" unless bike.class == Bike
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def empty?
    bike_count == 0
  end

  def available_bikes
  bikes.reject {|bike| bike.broken? }
  end

  def unavailable_bikes
  bikes.reject {|bike| !bike.broken? }
end
end