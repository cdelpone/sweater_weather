require 'rails_helper'

RSpec.describe 'ForecastController', :vcr do
  it 'makes a successful call' do
    location = 'denver,CO'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end

  it 'returns expected hash keys' do
    location = 'Denver,CO'
    get "/api/v1/forecast?location=#{location}"

    forecast_data = JSON.parse(response.body, symbolize_names: true)

    expect(forecast_data).to be_a Hash
    expect(forecast_data).to have_key(:current_weather)
    expect(forecast_data[:current_weather]).to be_a Hash
    expect(forecast_data).to have_key(:hourly_weather)
    expect(forecast_data[:hourly_weather]).to be_an Array
    expect(forecast_data[:hourly_weather].size).to eq(8)
    expect(forecast_data).to have_key(:daily_weather)
    expect(forecast_data[:daily_weather]).to be_an Array
    expect(forecast_data[:daily_weather].size).to eq(5)
    current_weather = forecast_data[:current_weather]
    expect(current_weather).to be_a Hash
    expect(current_weather).to have_key(:date_time)
    expect(current_weather).to have_key(:sunrise)
    expect(current_weather).to have_key(:sunset)
    expect(current_weather).to have_key(:temperature)
    expect(current_weather).to have_key(:feels_like)
    expect(current_weather).to have_key(:humidity)
    expect(current_weather).to have_key(:uvi)
    expect(current_weather).to have_key(:visibility)
    expect(current_weather).not_to have_key(:weather)
    expect(current_weather).to have_key(:conditions)
    expect(current_weather).to have_key(:icon)

    hourly_weather = forecast_data[:hourly_weather][0]
    expect(hourly_weather).to be_a Hash
    expect(hourly_weather).to have_key(:date_time)
    expect(hourly_weather).to have_key(:temperature)
    expect(hourly_weather).not_to have_key(:weather)
    expect(hourly_weather).to have_key(:conditions)
    expect(hourly_weather).to have_key(:icon)


    daily_weather = forecast_data[:daily_weather][0]
    expect(daily_weather).to be_a Hash
    expect(daily_weather).to have_key(:date_time)
    expect(daily_weather).to have_key(:sunrise)
    expect(daily_weather).to have_key(:sunset)

    expect(daily_weather).not_to have_key(:temperature)
    expect(daily_weather).to have_key(:min_temp)
    expect(daily_weather).to have_key(:max_temp)

    expect(daily_weather).not_to have_key(:weather)
    expect(daily_weather).to have_key(:conditions)
    expect(daily_weather).to have_key(:icon)
  end

  it 'does not return unnecessary data' do
  end
end
# expected = { :data => {
#                       :id=>nil,
#                       :type=>"forecast",
#                       :attributes=> {
#                                     :current_weather=> {
#                                                         :conditions=>"overcast clouds",
#                                                         :date_time=>"2021-11-16T17:48:05.000-07:00",
#                                                         :feels_like=>55.02,
#                                                         :humidity=>23,
#                                                         :icon=>"04n",
#                                                         :sunrise=>"2021-11-16T06:46:09.000-07:00",
#                                                         :sunset=>"2021-11-16T16:43:41.000-07:00",
#                                                         :temperature=>58.41,
#                                                         :uvi=>0,
#                                                         :visibility=>10000
#                                                       },
#                                     :daily_weather=> [
#                                                       {:conditions=>"overcast clouds", :date_time=>"2021-11-16T11:00:00.000-07:00", :icon=>"04d", :max_temp=>68.05, :min_temp=>46.8, :sunrise=>"2021-11-16T06:46:09.000-07:00", :sunset=>"2021-11-16T16:43:41.000-07:00"},
#                                                       {:conditions=>"broken clouds", :date_time=>"2021-11-17T11:00:00.000-07:00", :icon=>"04d", :max_temp=>42.98, :min_temp=>34.63, :sunrise=>"2021-11-17T06:47:17.000-07:00", :sunset=>"2021-11-17T16:42:57.000-07:00"},
#                                                       {:conditions=>"clear sky", :date_time=>"2021-11-18T11:00:00.000-07:00", :icon=>"01d", :max_temp=>49.24, :min_temp=>32.27, :sunrise=>"2021-11-18T06:48:26.000-07:00", :sunset=>"2021-11-18T16:42:16.000-07:00"},
#                                                       {:conditions=>"overcast clouds", :date_time=>"2021-11-19T11:00:00.000-07:00", :icon=>"04d", :max_temp=>61.65, :min_temp=>43.93, :sunrise=>"2021-11-19T06:49:34.000-07:00", :sunset=>"2021-11-19T16:41:36.000-07:00"},
#                                                       {:conditions=>"overcast clouds", :date_time=>"2021-11-20T11:00:00.000-07:00", :icon=>"04d", :max_temp=>58.75, :min_temp=>44.8, :sunrise=>"2021-11-20T06:50:41.000-07:00", :sunset=>"2021-11-20T16:40:58.000-07:00"}
#                                                      ],
#                                     :hourly_weather=> [
#                                                         {:conditions=>"overcast clouds", :date_time=>"2021-11-16T17:00:00.000-07:00", :icon=>"04n", :temperature=>58.86},
#                                                         {:conditions=>"overcast clouds", :date_time=>"2021-11-16T18:00:00.000-07:00", :icon=>"04n", :temperature=>58.41},
#                                                         {:conditions=>"overcast clouds", :date_time=>"2021-11-16T19:00:00.000-07:00", :icon=>"04n", :temperature=>58.15},
#                                                         {:conditions=>"broken clouds", :date_time=>"2021-11-16T20:00:00.000-07:00", :icon=>"04n", :temperature=>57.15},
#                                                         {:conditions=>"broken clouds", :date_time=>"2021-11-16T21:00:00.000-07:00", :icon=>"04n", :temperature=>55.27},
#                                                         {:conditions=>"scattered clouds", :date_time=>"2021-11-16T22:00:00.000-07:00", :icon=>"03n", :temperature=>50.79},
#                                                         {:conditions=>"few clouds", :date_time=>"2021-11-16T23:00:00.000-07:00", :icon=>"02n", :temperature=>46.8},
#                                                         {:conditions=>"clear sky", :date_time=>"2021-11-17T00:00:00.000-07:00", :icon=>"01n", :temperature=>42.98}
#                                                       ]
#                                     }
#                       }
#             }
# {
#   "data": {
#     "id": null,
#     "type": "forecast",
#     "attributes": {
#       "current_weather": {
#         "datetime": "2020-09-30 13:27:03 -0600",
#         "temperature": 79.4,
#         "sunrise": "2020-10-01 06:10:43 -0600",
#         "sunset": "2020-10-01 06:10:43 -0600",
#         "feels_like": 289.67,
#         "humidity": 24,
#         "uvi": 1.31,
#         "visibility": 10000,
#         "conditions": "overcast clouds",
#         "icon": "04d"
#       },
#       "daily_weather": [
#         {
#           "date": "2020-10-01",
#           "sunrise": "2020-10-01 06:10:43 -0600",
#           "sunset": "2020-10-01 06:10:43 -0600",
#           "min_temp": 281.37,
#           "max_temp": 292.8,
#           "conditions": "overcast clouds",
#           "icon": "04d"
#         },
#       ],
#       "hourly_weather": [
#         {
#           "time": "14:00:00",
#           "temperature": 79.4,
#           "conditions": "overcast clouds",
#           "icon": "04d"
#         },
#       ]
#     }
#   }
# }
