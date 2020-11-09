class TrailFacade
    def self.find_trail(params)
        response = TrailService.find_trail(params)
        data = response[:trails]
        trails = []
        data.each do |trail|
            trails << Trail.new(trail, params)
        end 
        trails
    end 
end