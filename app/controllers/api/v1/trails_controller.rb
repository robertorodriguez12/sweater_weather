class Api::V1::TrailsController < ApplicationController
    def index
        location = params[:location]
        coord = MapFacade.fetch_lat_long(location)
        f = Finish.new(coord, location)
        render json: FinishSerializer.new(f)
    end
end 