class MunchieFacade

    def self.find_restaurant(params)
        yelp = MunchieService.find_restaurant(params[:end],params[:food])
        travel_time = MapService.get_travel_time(params[:start],params[:end])
        coord = MapFacade.fetch_lat_long(params[:end])
        weather = WeatherService.get_weather(coord)
        Munchie.new(yelp, travel_time, weather)
    end   
end