require 'rails_helper'

RSpec.describe WeatherFacade do
    it 'can fetch the weather for a location' do
        location = [39.738453, -104.984853]

        response = WeatherFacade.fetch_weather(location)
        expect(response.current_weather).to be_a(Hash)
        expect(response.daily_weather).to be_an(Array)
        expect(response.hourly_weather).to be_an(Array)
    end

    it 'can fetch weather for a location at estimated time of arrival' do
        destination = [39.738453, -104.984853]
        time = 1605160800

        response = WeatherFacade.weather_at_arrival(destination, time)
        expect(response).to be_a(Hash)
        expect(response).to have_key(:temp)
    end
end