require 'rails_helper'
require 'webmock/rspec'

RSpec.describe ImageFacade do
  it 'returns an image object' do
    location = 'denver,co'

    body = File.read('spec/fixtures/image_data_denver.json')
    stub_request(:get, "https://api.bing.microsoft.com/v7.0/images/search?q=#{location}&Subscription-Key=#{ENV['AZURE_Key']}").
         to_return(status: 200, body: body, headers: {})

    result = ImageFacade.fetch_image(location)

    expect(result).to be_a(Image)
    expect(result.image_url).to be_a(String)
    expect(result.credit).to be_a(String)
  end
end