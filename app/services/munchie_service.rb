class MunchieService
    def self.find_restaurant(destination, term)
        response = conn.get('/v3/businesses/search') do |faraday|
            faraday.params['term'] = term
            faraday.params['location'] = destination
            faraday.params['open_now'] = true
        end
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn
        Faraday.new(url: 'https://api.yelp.com') do |faraday|
            faraday.headers['Authorization'] = "Bearer #{ENV['YELP_API_Key']}"
        end
    end
end