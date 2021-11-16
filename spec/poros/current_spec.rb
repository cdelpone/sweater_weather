require 'rails_helper'

RSpec.describe Current do
  it 'creates a current poro' do
    current_data = {
                    dt: 1637083722,
                    sunrise: 1637070369,
                    sunset: 1637106221,
                    temp: 291.18,
                    feels_like: 289.67,
                    humidity: 24,
                    uvi: 1.31,
                    visibility: 10000,
                    weather: [
                        {
                            description: "overcast clouds",
                            icon: "04d"
                        }
                    ]
                  }
    location = 'Denver,CO'
    current = Current.new(current_data)

    expect(current.date_time).to eq('2021-11-16 10:28:42.000000000 -0700')
    expect(current.sunrise).to eq('2021-11-16 06:46:09.000000000 -0700')
    expect(current.sunset).to eq('2021-11-16 16:43:41.000000000 -0700')
    expect(current.temperature).to eq(291.18)
    expect(current.feels_like).to eq(289.67)
    expect(current.humidity).to eq(24)
    expect(current.uvi).to eq(1.31)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("overcast clouds")
    expect(current.icon).to eq("04d")
  end
end
