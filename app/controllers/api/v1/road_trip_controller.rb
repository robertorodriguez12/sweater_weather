class Api::V1::RoadTripController < ApplicationController
    def create
        user = User.find_by(api_key: params[:api_key])
        if user && !params[:origin].nil? && !params[:destination].nil? 
            road_trip = RoadTripFacade.get_route(params)
            render json: RoadTripSerializer.new(road_trip)
        else 
            render json: "You are missing a required field", status: 401
        end 
    end
end