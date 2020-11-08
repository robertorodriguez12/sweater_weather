class Api::V1::WeatherController < ApplicationController
    def local
        location = params[:location]
        lat_long = MapFacade.fetch_lat_long(location)
        forecast = WeatherFacade.fetch_weather(lat_long)
        render json: ForecastSerializer.new(forecast)
    end
end 