require 'rails_helper'

RSpec.describe 'Mapquest API ' do
  it 'exists and has attributes' do
    get '/api/v1/forecast?location=Denver,CO'
    expect(response).to eq('')

  end
end
