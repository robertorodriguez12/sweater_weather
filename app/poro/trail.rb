class Trail
    def initialize(data, coord)
        binding.pry
        @name = data[:name]
        @summary = data[:summary]
        @difficulty = data[:difficulty]
        @location = data[:location]
        @distance_to_trail = distance_to_trail
    end
    
end