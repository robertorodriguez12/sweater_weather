class WeatherService


    def self.get_weather(location)
        response = conn.get('/data/2.5/onecall') do |faraday|
            faraday.params['lat'] = location[0]
            faraday.params['lon'] = location[1]
            faraday.params['appid'] = ENV['WEATHER_API_Key']
        end 
        JSON.parse(response.body, symbolize_names: true)
    end 

    private

    def self.conn
        Faraday.new(url: 'http://api.openweathermap.org') do |faraday|
        end
    end 
    
end