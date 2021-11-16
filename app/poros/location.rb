class Location
  attr_reader :latitude,
              :longitude,
              :provided_location

  def initialize(data)
    @latitude = data[:latitude]
    @longitude = data[:longitude]
    @provided_location = data[:provided_location]
  end
end
