require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do

  it 'is valid when instantiated with a proper URL' do
    shortned_url = ShortenedUrl.new( destination: "https://www.dia.com/who-we-are" ) 
    expect( shortned_url.valid? ).to be true
  end

  it 'is invalid when instantiated with an improper URL' do
    shortned_url = ShortenedUrl.new( destination: "garbage" ) 
    expect( shortned_url.valid? ).to be false
  end
end
