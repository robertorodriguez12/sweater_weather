class MapService
    def self.get_lat_long(location)
        response = conn.get('/geocoding/v1/address') do |faraday|
            faraday.params['location'] = location
            faraday.params['key'] = ENV['MAP_API_Key']
        end 
    end

    def self.fetch_distance(destination, start_point)
        a = start_point[0].to_s
        b = start_point[1].to_s
        c = "#{a}, #{b}"
        response = conn.get('/directions/v2/route') do |faraday|
            faraday.params['from'] = c
            faraday.params['to'] = destination
            faraday.params['key'] = ENV['MAP_API_Key']
        end
        JSON.parse(response.body, symbolize_names: true)
    end
    
    private

    def self.conn
        Faraday.new(url: 'https://www.mapquestapi.com')
    end 
end