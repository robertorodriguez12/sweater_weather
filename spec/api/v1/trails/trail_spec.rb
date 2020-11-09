require 'rails_helper'

RSpec.describe Trail do
    it 'can connect to the trails endpoint' do
        get '/api/v1/trails?location=denver,co'
        expect(response).to be_successful
    end
end