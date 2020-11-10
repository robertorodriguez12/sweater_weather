require 'rails_helper'

RSpec.describe "Munchie endpoint" do
    it 'returns a restaurant that is open at the destination city' do
        get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

        expect(response).to be_successful

        munchie = JSON.parse(response.body, symbolize_names: true)
        expect(munchie).to be_a(Hash)
        expect(munchie).to have_key(:data)
        expect(munchie[:data]).to be_a(Hash)
        expect(munchie[:data]).to have_key(:id)
        expect(munchie[:data][:id]).to eq(nil)
        expect(munchie[:data]).to have_key(:type)
        expect(munchie[:data][:type]).to eq('munchie')
        expect(munchie[:data]).to have_key(:attributes)
        expect(munchie[:data][:attributes]).to be_a(Hash)
        expect(munchie[:data][:attributes]).to have_key(:destination_city)
        expect(munchie[:data][:attributes]).to have_key(:travel_time)
        expect(munchie[:data][:attributes]).to have_key(:forecast)
        expect(munchie[:data][:attributes][:forecast]).to have_key(:summary)
        expect(munchie[:data][:attributes][:forecast]).to have_key(:temperature)
        expect(munchie[:data][:attributes]).to have_key(:restaurant)
        expect(munchie[:data][:attributes][:restaurant]).to have_key(:name)
        expect(munchie[:data][:attributes][:restaurant]).to have_key(:address)
        expect(munchie[:data][:attributes][:destination_city]).to be_a(String)
        expect(munchie[:data][:attributes][:forecast]).to be_a(Hash)
        expect(munchie[:data][:attributes][:restaurant]).to be_a(Hash)
    end
end