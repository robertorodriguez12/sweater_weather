require 'rails_helper'

RSpec.describe MapFacade do
    it 'can get the coordinates for a location' do
        location = 'denver,co'

        result = MapFacade.fetch_lat_long(location)
        expect(result).to be_an(Array)
        expect(result[0]).to be_a(Float)
        expect(result[1]).to be_a(Float)
    end

    it 'can retrieve a route between start and end point' do
        start = 'denver,co'
        destination = 'pueblo,co'

        result = MapFacade.get_route(start, destination)
        expect(result).to be_a(Hash)
        expect(result).to have_key(:route)
        expect(result[:route]).to have_key(:formattedTime)
        expect(result[:route]).to have_key(:distance)
    end
end