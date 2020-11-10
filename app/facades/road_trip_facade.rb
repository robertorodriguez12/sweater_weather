class RoadTripFacade
    def self.get_route(params)
        route = MapFacade.get_route(params[:origin],params[:destination])
        forecast = get_forecast_at_arrival(params, route)
        travel_duration = route[:formattedTime]
        RoadTrip.new(params[:origin],params[:destination],travel_duration, forecast)
    end
    
    def self.get_forecast_at_arrival(params, route)
        dest_coord = MapFacade.fetch_lat_long(params[:destination])
        travel_time = (route[:realTime].to_f / 60 / 60 / 24).round(2)
        arrival_time = (DateTime.now + travel_time).beginning_of_hour.to_i
        WeatherFacade.weather_at_arrival(dest_coord, arrival_time)        
    end
end