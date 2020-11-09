require 'rails_helper'

RSpec.describe Trail do
    it 'can connect to the trails endpoint' do
        get '/api/v1/trails?location=denver,co'
        expect(response).to be_successful

        trails = JSON.parse(response.body, symbolize_names: true)
        binding.pry
        expect(trails).to be_a(Hash)
        expect(trails).to have_key(:data)
    end
end