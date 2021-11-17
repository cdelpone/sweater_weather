class ForecastSerializer
  class << self
  # include JSONAPI::Serializer
  # set_id nil
  # attributes  :date_time,:sunrise, :sunset,:temperature,:feels_like, :humidity, :uvi, :visibility, :weather, :conditions, :icon,
  #             :date_time, :temperature, :conditions, :icon,
  #             :date_time, :sunrise, :sunset, :min_temp, :max_temp,:conditions, :icon
    # attributes :current_weather_object, :daily_weather_object, :daily_weather_object
    def serialize(data)
      {
        current_weather: data[:data][:attributes][:current_weather],
        hourly_weather: data[:data][:attributes][:hourly_weather],
        daily_weather: data[:data][:attributes][:daily_weather]
      }
          # date_time: data[:data][:attributes][:current_weather]

    end
  end
end
