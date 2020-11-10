require 'rails_helper'

RSpec.describe ImageFacade do
  it 'returns an image object' do
    location = 'denver,co'
    
    result = ImageFacade.fetch_image(location)

    expect(result).to be_a(Image)
    expect(result.image_url).to be_a(String)
    expect(result.credit).to be_a(String)
  end
end