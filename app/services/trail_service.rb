class TrailService
    def self.find_trail(data)
        response = conn.get('/data/get-trails') do |faraday|
            faraday.params['lat'] = data[0]
            faraday.params['lon'] = data[1]
            faraday.params['key'] = ENV['TRAILS_API_Key']
        end
        JSON.parse(response.body, symbolize_names: true)
    end
    private

    def self.conn
        Faraday.new(url: 'https://www.hikingproject.com')
    end
end