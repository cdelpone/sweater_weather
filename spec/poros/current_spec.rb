require 'rails_helper'

RSpec.describe Current do
  it 'creates a current poro' do
    current_data = {
                :lat=>39.7392,
                :lon=>-104.9847,
                :timezone=>"America/Denver",
                :timezone_offset=>-25200,
                :current=>
                {:dt=>1637083722,
                 :sunrise=>1637070369,
                 :sunset=>1637106221,
                 :temp=>51.71,
                 :feels_like=>48.22,
                 :pressure=>1015,
                 :humidity=>35,
                 :dew_point=>25.77,
                 :uvi=>1,
                 :clouds=>98,
                 :visibility=>10000,
                 :wind_speed=>4,
                 :wind_deg=>56,
                 :wind_gust=>10,
                 :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]}
               }

    location = 'Denver,CO'
    current = Current.new(current_data)

    expect(current.datetime).to eq('2021-11-16 10:28:42.000000000 -0700')
    expect(current.sunrise).to eq('2021-11-16 06:46:09.000000000 -0700')
    expect(current.sunset).to eq('2021-11-16 16:43:41.000000000 -0700')
    expect(current.temperature).to eq(51.71)
    expect(current.feels_like).to eq(48.22)
    expect(current.humidity).to eq(35)
    expect(current.uvi).to eq(1)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("overcast clouds")
    expect(current.icon).to eq("04d")
  end
end
