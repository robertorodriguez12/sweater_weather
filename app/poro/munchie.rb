class Munchie
    attr_reader :destination, :formatted_time, :forecast, :restaurant

    def initialize(yelp, travel_time, weather, destination)
        @yelp = yelp
        @travel_time = travel_time
        @weather = weather
        @destination = destination.capitalize
    end
    
    def formatted_time
        hour = @travel_time.slice(1, 1)
        minute = @travel_time.slice(3, 2)
        "#{hour} hours #{minute} min"
    end
    
    def forecast
       {summary: @weather[:current][:weather].first[:description],
        temperature: @weather[:current][:temp] }
    end

    def restaurant
        {name: @yelp[:businesses].first[:name],
        address: @yelp[:businesses].first[:location][:display_address]}
    end
    
end