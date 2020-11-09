class Api::V1::TrailsController < ApplicationController
    def index
        location = params[:location]
        coord = MapFacade.fetch_lat_long(location)
        forecast = WeatherFacade.fetch_weather(lat_long)
        trail = TrailFacade.find_trail(lat_long)
        binding.pry
    end
end 