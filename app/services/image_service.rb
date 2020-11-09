class ImageService
    def self.get_image(location)
        response = conn.get('/v7.0/images/search') do |faraday|
            faraday.params['q'] = location
            faraday.params['Subscription-Key'] = ENV['AZURE_Key']
        end
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn
        Faraday.new(url: 'https://api.bing.microsoft.com')
    end
    
end