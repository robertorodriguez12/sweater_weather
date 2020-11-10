require 'rails_helper'

RSpec.describe "Road Trip" do
  before :each do
    params = { email: 'whatever@example.com', password: 'password', password_confirmation: 'password'}

    post "/api/v1/users?email=#{params[:email]}&password=#{params[:password]}&password_confirmation=#{params[:password_confirmation]}"
    json = JSON.parse(response.body, symbolize_names: true)
    @api_key = json[:data][:attributes][:api_key]
  end
    it 'creates a road trip with origin, destination, travel_time and arrival forecast attributes' do
      params = {origin: "Denver,CO",
                destination: "Pueblo,CO",
                api_key: @api_key}
      post "/api/v1/road_trip?origin=#{params[:origin]}&destination=#{params[:destination]}&api_key=#{params[:api_key]}"

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).to be_a(Hash)
      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to be_a(Hash)
      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq(nil)
      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to eq('road_trip')
      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).to be_a(Hash)
      expect(road_trip[:data][:attributes]).to have_key(:origin)
      expect(road_trip[:data][:attributes][:origin]).to be_a(String)
      expect(road_trip[:data][:attributes]).to have_key(:destination)
      expect(road_trip[:data][:attributes][:destination]).to be_a(String)
      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
end