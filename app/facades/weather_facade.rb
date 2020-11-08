class WeatherFacade

    def self.fetch_weather(location)
        data = WeatherService.get_weather(location)
        Forecast.new(data)
    end
end