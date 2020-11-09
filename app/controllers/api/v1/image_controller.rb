class Api::V1::ImageController < ApplicationController
    def show
        location = params[:location]
        image = ImageFacade.fetch_image(location)
    end
end 