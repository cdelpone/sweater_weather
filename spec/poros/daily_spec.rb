require 'rails_helper'

RSpec.describe Daily do
  it 'creates a daily poro' do
    daily_data = {
                    dt: 1637085600,
                    sunrise: 1637070369,
                    sunset: 1637106221,
                    temp: {
                        min: 281.37,
                        max: 292.8,
                    },
                    weather: [
                        {
                            description: "overcast clouds",
                            icon: "04d"
                        }
                    ]
                  }
    location = 'Denver,CO'

    daily = Daily.new(daily_data)

    expect(daily.date_time).to eq('2021-11-16 11:00:00 -0700')
    expect(daily.sunrise).to eq('2021-11-16 06:46:09.000000000 -0700')
    expect(daily.sunset).to eq('2021-11-16 16:43:41.000000000 -0700')
    expect(daily.min_temp).to eq(281.37)
    expect(daily.max_temp).to eq(292.8)
    expect(daily.conditions).to eq("overcast clouds")
    expect(daily.icon).to eq("04d")
  end
end
