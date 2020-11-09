class MapService
    def self.get_lat_long(location)
        response = conn.get('/geocoding/v1/address') do |faraday|
            faraday.params['location'] = location
            faraday.params['key'] = ENV['MAP_API_Key']
        end 
    end

    def self.fetch_distance(destination, start_point)
        binding.pry
        # response = conn.get('/directions/v2/route') do |faraday|
        #     faraday.params['latLng'] = 
        # end
    end
    
    private

    def self.conn
        Faraday.new(url: 'https://www.mapquestapi.com')
    end 
end