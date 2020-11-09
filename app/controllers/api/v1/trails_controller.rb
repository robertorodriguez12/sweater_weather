class Api::V1::TrailsController < ApplicationController
    def index
        location = params[:location]
        coord = MapFacade.fetch_lat_long(location)
        forecast = WeatherFacade.fetch_weather(coord)
        trail = TrailFacade.find_trail(coord)
        binding.pry
    end
end 