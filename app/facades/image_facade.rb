class ImageFacade
    def self.fetch_image(location)
        data = ImageService.get_image(location)
        Image.new(data, location)
    end
    
end