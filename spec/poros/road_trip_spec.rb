require 'rails_helper'

RSpec.describe RoadTrip do
  it 'creates a hourly poro' do
    rt_data = {
                origin: "denver, co",
                destination: "estes park, co",
                travel_time: "01:22:19",
                weather_at_eta: { conditions: "overcast clouds", temperature: 25.63}
              }

    rt = RoadTrip.new(rt_data)

    expect(rt.start_city).to eq("denver, co")
    expect(rt.end_city).to eq("estes park, co")
    expect(rt.travel_time).to eq("01:22:19")
    expect(rt.weather_at_eta).to be_a Hash
    expect(rt.weather_at_eta[:conditions]).to eq("overcast clouds")
    expect(rt.weather_at_eta[:temperature]).to eq(25.63)
  end
end
