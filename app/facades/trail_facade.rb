class TrailFacade
    def self.find_trail(data)
        response = TrailService.find_trail(data)
        Trail.new(response, data)
    end 
end