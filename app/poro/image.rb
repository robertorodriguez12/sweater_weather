class Image
    attr_reader :location, :image_url, :credit
    def initialize(data, location)
        @location = location
        @image_url = data[:value].first[:thumbnailUrl]
        @credit = data[:value].first[:hostPageDomainFriendlyName] 
    end
end