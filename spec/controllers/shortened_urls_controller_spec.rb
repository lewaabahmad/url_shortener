require 'rails_helper'

RSpec.describe ShortenedUrlsController, type: :controller do

  describe 'create' do
    it 'creates new Shortened URL' do 
      destination = 'https://www.google.com/obscure-url' 
      params = { shortened_url: { destination: destination } }
      post :create, params: params
      expect( ShortenedUrl.find_by( destination: destination ) ).not_to be nil
    end
  end

end
