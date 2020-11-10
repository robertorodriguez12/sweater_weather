class RoadTrip

    attr_reader :origin,
                :destination,
                :travel_time,
                :weather_at_eta

    def initialize(origin, destination, time, forecast)
        @origin = origin.capitalize
        @destination = destination.capitalize
        @time = time
        @weather = forecast
    end

    def travel_time
        hour = @time.slice(1,1)
        min = @time.slice(3,2)
        "#{hour} hours, #{min} minutes"
    end

    def weather_at_eta
        {temperature: @weather[:temp],
        conditions: @weather[:weather].first[:description]}
    end
    
end