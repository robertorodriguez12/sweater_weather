require 'rails_helper'

RSpec.describe "Forecast request" do

  it "returns the forecast for a specific location" do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      weather = JSON.parse(response.body, symbolize_names: true)

      expect(weather).to be_a(Hash)
      expect(weather).to have_key(:data)
      expect(weather[:data]).to be_a(Hash)

      expect(weather[:data]).to have_key(:id)
      expect(weather[:data][:id]).to eq(nil)
      expect(weather[:data]).to have_key(:type)
      expect(weather[:data][:type]).to eq('forecast')
      expect(weather[:data]).to have_key(:attributes)
      expect(weather[:data][:attributes]).to be_a(Hash)

      expect(weather[:data][:attributes]).to have_key(:current_weather)
      expect(weather[:data][:attributes][:current_weather]).to be_a(Hash)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(weather[:data][:attributes][:current_weather][:datetime]).to be_a(String)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(weather[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(weather[:data][:attributes][:current_weather][:sunset]).to be_a(String)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(weather[:data][:attributes][:current_weather][:temperature]).to be_a(Numeric)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(weather[:data][:attributes][:current_weather][:feels_like]).to be_a(Numeric)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(weather[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(weather[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(weather[:data][:attributes][:current_weather][:visibility]).to be_a(Numeric)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(weather[:data][:attributes][:current_weather][:conditions]).to be_a(String)
      expect(weather[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(weather[:data][:attributes][:current_weather][:icon]).to be_a(String)

      expect(weather[:data][:attributes]).to have_key(:daily_weather)
      expect(weather[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(weather[:data][:attributes][:daily_weather].count).to eq(5)
      weather[:data][:attributes][:daily_weather].each do |day|
        expect(day).to have_key(:date)
        expect(day[:date]).to be_a(String)
        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).to be_a(String)
        expect(day).to have_key(:sunset)
        expect(day[:sunset]).to be_a(String)
        expect(day).to have_key(:max_temp)
        expect(day[:max_temp]).to be_a(Numeric)
        expect(day).to have_key(:min_temp)
        expect(day[:min_temp]).to be_a(Numeric)
        expect(day).to have_key(:conditions)
        expect(day[:conditions]).to be_a(String)
        expect(day).to have_key(:icon)
        expect(day[:icon]).to be_a(String)
      end

      expect(weather[:data][:attributes]).to have_key(:hourly_weather)
      expect(weather[:data][:attributes][:hourly_weather]).to be_an(Array)
      expect(weather[:data][:attributes][:hourly_weather].count).to eq(8)
      weather[:data][:attributes][:hourly_weather].each do |hour|
        expect(hour).to have_key(:time)
        expect(hour[:time]).to be_a(String)
        expect(hour).to have_key(:wind_speed)
        expect(hour[:wind_speed]).to be_a(String)
        expect(hour).to have_key(:wind_direction)
        expect(hour[:wind_direction]).to be_a(String)
        expect(hour).to have_key(:conditions)
        expect(hour[:conditions]).to be_a(String)
        expect(hour).to have_key(:icon)
        expect(hour[:icon]).to be_a(String)
      end
    end
end

