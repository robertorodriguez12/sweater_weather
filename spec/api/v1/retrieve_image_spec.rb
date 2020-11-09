require 'rails_helper'

RSpec.describe "Background Image Request" do
    it 'returns a background image for a specific location' do
        get '/api/v1/backgrounds?location=denver,co'

        expect(response).to be_successful
        image = JSON.parse(response.body, symbolize_names: true)
        expect(image).to be_a(Hash)
        expect(image).to have_key(:data)
        expect(image[:data]).to be_a(Hash)
        expect(image[:data]).to have_key(:id)
        expect(image[:data][:id]).to eq(nil)
        expect(image[:data]).to have_key(:type)
        expect(image[:data][:type]).to eq('image')
        expect(image[:data]).to have_key(:attributes)
        expect(image[:data][:attributes]).to be_a(Hash)
        expect(image[:data][:attributes]).to have_key(:location)
        expect(image[:data][:attributes]).to have_key(:image_url)
        expect(image[:data][:attributes]).to have_key(:credit)
        expect(image[:data][:attributes][:location]).to be_a(String)
        expect(image[:data][:attributes][:image_url]).to be_a(String)
        expect(image[:data][:attributes][:credit]).to be_a(String)
    end
end 