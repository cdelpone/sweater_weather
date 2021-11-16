class Hourly
  attr_reader :date_time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @date_time = Time.at(data[:dt])
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
