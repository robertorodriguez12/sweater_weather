class MapService
    def self.get_lat_long(location)
        response = conn.get('/geocoding/v1/address') do |faraday|
            faraday.params['location'] = location
            faraday.params['key'] = ENV['MAP_API_Key']
        end
    end

    def self.get_travel_time(from, to)
        response = conn.get('/directions/v2/route') do |faraday|
            faraday.params['from'] = from
            faraday.params['to'] = to
            faraday.params['key'] = ENV['MAP_API_Key']
        end
        json = JSON.parse(response.body, symbolize_names: true)
        json[:route][:formattedTime]
    end
    
    private

    def self.conn
        Faraday.new(url: 'https://www.mapquestapi.com')
    end 
end