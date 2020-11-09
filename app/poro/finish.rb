class Finish
    attr_reader :id
    def initialize(coord)
        @id = nil
        @coord = coord
    end

    def trails
        TrailFacade.find_trail(@coord)
    end 

    def forecast
        a = WeatherFacade.fetch_weather(@coord)
        b = a.current_weather[:conditions]
        c = a.current_weather[:temperature]
        d = b, c 
    end
end