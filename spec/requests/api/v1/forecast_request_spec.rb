require 'rails_helper'

RSpec.describe 'Mapquest API ' do
  it 'makes a successful call' do
    location = 'Denver,CO'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end
end
# {
#   "data": {
#     "id": null,
#     "type": "forecast",
#     "attributes": {
#       "current_weather": {
#         "datetime": "2020-09-30 13:27:03 -0600",
#         "temperature": 79.4,
#         etc
#       },
#       "daily_weather": [
#         {
#           "date": "2020-10-01",
#           "sunrise": "2020-10-01 06:10:43 -0600",
#           etc
#         },
#         {...} etc
#       ],
#       "hourly_weather": [
#         {
#           "time": "14:00:00",
#           "conditions": "cloudy with a chance of meatballs",
#           etc
#         },
#         {...} etc
#       ]
#     }
#   }
# }
