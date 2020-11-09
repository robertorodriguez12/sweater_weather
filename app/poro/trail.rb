class Trail
    
    attr_reader :name,
                :summary,
                :difficulty, 
                :location, 
                :distance_to_trail,
                :id

    def initialize(data, coord)
        @id = nil
        @name = data[:name]
        @summary = data[:summary]
        @difficulty = data[:difficulty]
        @location = data[:location]
        @start_point = coord
        @distance_to_trail = distance_to_trail
    end

    def distance_to_trail
        a = MapFacade.fetch_distance(@location, @start_point)
        a[:route][:distance]
    end
    
end