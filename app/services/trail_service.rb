class TrailService
    def self.find_trail(data)
        
    end
    private

    def self.conn
        Faraday.new(url: 'https://www.hikingproject.com')
    end
end