class RoadTripError
    
    attr_reader :origin,
                :destination,
                :travel_time,
                :weather_at_eta

    def initialize(start_city, end_city)
        @origin = start_city
        @destination = end_city
        @travel_time = 'Impossible'
    end

    def weather_at_eta
        {temperature: "",
        conditions: ""}
    end
    
end