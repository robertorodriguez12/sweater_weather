class WeatherFacade

    def self.fetch_weather(location)
        data = WeatherService.get_weather(location)
        Forecast.new(data)
    end

    def self.weather_at_arrival(destination, time_of_arrival)
        data = WeatherService.get_weather(destination)
        data[:hourly].find { |hash| hash if hash[:dt] == time_of_arrival }
    end
end