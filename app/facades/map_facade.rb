class MapFacade
    def self.fetch_lat_long(location)
        response = MapService.get_lat_long(location)
        data = JSON.parse(response.body, symbolize_names: true)
        lat = data[:results].first[:locations].first[:latLng][:lat]
        lng = data[:results].first[:locations].first[:latLng][:lng]
        lat_lng = [lat, lng]
    end 
end