require 'rails_helper'

RSpec.describe 'BreweriesController', :vcr do
  before :each do
    @brewery_params = { location: 'Denver, CO', quantity: 5 }
    @city = 'Denver'
    get "/api/v1/breweries?location=denver,co&quantity=5"
  end

  it 'makes a successful call' do
    expect(response).to be_successful

    nearby_breweries = BreweriesFacade.get_brewery_data(@brewery_params)
    first_brewery = nearby_breweries[:data][:attributes][:breweries].first

    # expect(response.body).to be_a JSON
    # {:data=>
    #   {:id=>nil,
    #    :type=>"breweries",
    #    :attributes=>
    #     {:destination=>"Denver, CO",
    #      :forecast=>{:summary=>"broken clouds", :temperature=>"33.3 F"},
    #      :breweries=>
    #       [#<Brewery:0x0000000107dff428
    #         @brewery_type="large",
    #         @id="10-barrel-brewing-co-denver-denver",
    #         @name="10 Barrel Brewing Co - Denver">,
    #        #<Brewery:0x0000000107dff400
    #         @brewery_type="proprietor",
    #         @id="14er-brewing-company-denver",
    #         @name="14er Brewing Company">,
    #        #<Brewery:0x0000000107dff3d8
    #         @brewery_type="planning",
    #         @id="aero-craft-brewing-denver",
    #         @name="Aero Craft Brewing">,
    #        #<Brewery:0x0000000107dff3b0
    #         @brewery_type="micro",
    #         @id="alpine-dog-brewing-co-denver",
    #         @name="Alpine Dog Brewing Co">,
    #        #<Brewery:0x0000000107dff388
    #         @brewery_type="micro",
    #         @id="alternation-brewing-company-denver",
    #         @name="Alternation Brewing Company">]}}}
  end

  it 'gets all brewery data' do
    nearby_breweries = JSON.parse(response.body, symbolize_names: true)

    expect(nearby_breweries).to be_a Hash
    expect(nearby_breweries[:data]).to be_a Hash
    expect(nearby_breweries[:data]).to have_key :id
    expect(nearby_breweries[:data]).to have_key :type
    expect(nearby_breweries[:data][:type]).to eq("breweries")
    expect(nearby_breweries[:data]).to have_key :attributes

    attributes = nearby_breweries[:data][:attributes]
    expect(attributes).to be_a Hash
    expect(attributes).to have_key :destination
    expect(attributes[:destination]).to be_a String

    expect(attributes).to have_key :forecast
    expect(attributes[:forecast]).to be_a Hash
    expect(attributes[:forecast]).to have_key :summary
    expect(attributes[:forecast]).to have_key :temperature

    expect(attributes).to have_key :breweries
    expect(attributes[:breweries]).to be_an Array
    expect(attributes[:breweries].size).to eq(5)

    breweries = attributes[:breweries][0]

    expect(breweries).to be_a Hash
    expect(breweries).to have_key :id
    expect(breweries).to have_key :name
    expect(breweries).to have_key :brewery_type

    expect(breweries).to_not have_key :street
    expect(breweries).to_not have_key :address_2
    expect(breweries).to_not have_key :address_3
    expect(breweries).to_not have_key :city
    expect(breweries).to_not have_key :state
    expect(breweries).to_not have_key :county_province
    expect(breweries).to_not have_key :postal_code
    expect(breweries).to_not have_key :country
    expect(breweries).to_not have_key :longitude
    expect(breweries).to_not have_key :latitude
    expect(breweries).to_not have_key :phone
    expect(breweries).to_not have_key :website_url
    expect(breweries).to_not have_key :created_at
    expect(breweries).to_not have_key :updated_at

    # {:data=>
    #   {:id=>nil,
    #     :type=>"breweries",
    #     :attributes=>
    #     {:destination=>"denver,co",
    #       :forecast=>{:summary=>"broken clouds", :temperature=>"33.3 F"},
    #       :breweries=>
    #       [{:id=>"10-barrel-brewing-co-denver-denver",
    #         :name=>"10 Barrel Brewing Co - Denver",
    #         :brewery_type=>"large"},
    #         {:id=>"14er-brewing-company-denver", :name=>"14er Brewing Company", :brewery_type=>"proprietor"},
    #         {:id=>"aero-craft-brewing-denver", :name=>"Aero Craft Brewing", :brewery_type=>"planning"},
    #         {:id=>"alpine-dog-brewing-co-denver", :name=>"Alpine Dog Brewing Co", :brewery_type=>"micro"},
    #         {:id=>"alternation-brewing-company-denver",
    #           :name=>"Alternation Brewing Company",
    #           :brewery_type=>"micro"}]}}}

  end

  it 'returns expected keys and data types' do

  end

  it 'does not return unnecessary data' do

  end
end
