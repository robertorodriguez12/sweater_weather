class Api::V1::MunchieController < ApplicationController
    def find
        munchie = MunchieFacade.find_restaurant(params)
    end
end 
