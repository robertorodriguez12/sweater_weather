require 'rails_helper'

RSpec.describe Munchie do
    it 'can create a Munchie object' do
        unparsed_yelp = File.read('spec/fixtures/yelp_data.json')
        yelp = JSON.parse(unparsed_yelp, symbolize_names: true)
        unparsed_weather = File.read('spec/fixtures/current_weather.json')
        weather = JSON.parse(unparsed_weather, symbolize_names: true)
        travel_time = File.read('spec/fixtures/travel_time.txt')
        destination = "Denver, CO"
        
        munchie = Munchie.new(yelp, travel_time, weather, destination)
        

        expect(munchie).to be_a(Munchie)
        expect(munchie.destination_city).to be_a(String)
        expect(munchie.travel_time).to be_a(String)
        expect(munchie.forecast).to be_a(Hash)
        expect(munchie.restaurant).to be_a(Hash)
    end
end