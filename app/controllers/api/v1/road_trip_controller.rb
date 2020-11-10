class Api::V1::RoadTripController < ApplicationController
    def create
        road_trip = RoadTripFacade.get_route(params)
        render json: RoadTripSerializer.new(road_trip)
    end
    
end