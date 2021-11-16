require 'rails_helper'

RSpec.describe Hourly do
  it 'creates a hourly poro' do
    hourly_data = {
                    dt: 1637082000,
                    temp: 291.18,
                    weather: [
                        {
                            description: "overcast clouds",
                            icon: "04d"
                        }
                    ],
                }
    location = 'Denver,CO'

    hourly = Hourly.new(hourly_data)

    expect(hourly.date_time).to eq('2021-11-16 10:00:00.000000000 -0700')
    expect(hourly.temperature).to eq(291.18)
    expect(hourly.conditions).to eq("overcast clouds")
    expect(hourly.icon).to eq("04d")
  end
end
