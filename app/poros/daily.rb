class Daily
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :min_temp,
              :max_temp,
              :conditions,
              :icon

  def initialize(data)
    @date_time = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @min_temp = data[:temp][:min]
    @max_temp = data[:temp][:max]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
