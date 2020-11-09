require 'rails_helper'

RSpec.describe "Background Image Request" do
    it 'returns a background image for a specific location' do
        get '/api/v1/backgrounds?location=denver,co'

        expect(response).to be_successful
    end
end 