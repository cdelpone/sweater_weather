class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @start_city = data[:origin]
    @end_city = data[:destination]
    @travel_time = data[:travel_time]
    @weather_at_eta = data[:weather_at_eta]
  end
end
