require 'rails_helper'

RSpec.describe 'ForecastController' do
  it 'makes a successful call' do
    location = 'Denver,CO'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end

  it 'returns expected hash' do
    null = nil
    location = 'Denver,CO'

    get "/api/v1/forecast?location=#{location}"


    expected = {
                "data": {
                  "id": null,
                  "type": "forecast",
                  "attributes": {
                    "current_weather": {
                      "datetime": "2020-09-30 13:27:03 -0600",
                      "temperature": 79.4,
                      "sunrise": "2020-10-01 06:10:43 -0600",
                      "sunset": "2020-10-01 06:10:43 -0600",
                      "feels_like": 289.67,
                      "humidity": 24,
                      "uvi": 1.31,
                      "visibility": 10000,
                      "conditions": "overcast clouds",
                      "icon": "04d"
                    },
                    "daily_weather": [
                      {
                        "date": "2020-10-01",
                        "sunrise": "2020-10-01 06:10:43 -0600",
                        "sunset": "2020-10-01 06:10:43 -0600",
                        "min_temp": 281.37,
                        "max_temp": 292.8,
                        "conditions": "overcast clouds",
                        "icon": "04d"
                      },
                    ],
                    "hourly_weather": [
                      {
                        "time": "14:00:00",
                        "temperature": 79.4,
                        "conditions": "overcast clouds",
                        "icon": "04d"
                      },
                    ]
                  }
                }
              }
   expect(expected).to be_a Hash
  end

  it 'does not return unnecessary data' do
  end

  it 'accounts for edge cases' do
  end

  it 'handles sad paths' do
  end
end
