class Trail
    
    attr_reader :name,
                :summary,
                :difficulty, 
                :location, 
                :distance_to_trail

    def initialize(data, coord)
        @name = data[:trails].first[:name]
        @summary = data[:trails].first[:summary]
        @difficulty = data[:trails].first[:difficulty]
        @location = data[:trails].first[:location]
        @start_point = coord
        @distance_to_trail = distance_to_trail
    end

    def distance_to_trail
        a = MapFacade.fetch_distance(@location, @start_point)
        a[:route][:distance]
    end
    
end