require 'rails_helper'

RSpec.describe ShortenedUrlsController, type: :controller do

  describe 'post create' do
    it 'creates new Shortened URL' do 
      destination = 'https://www.google.com/obscure-url' 
      params = { shortened_url: { destination: destination } }
      post :create, params: params
      expect( ShortenedUrl.find_by( destination: destination ) ).not_to be nil
    end
  end

  describe 'get visit' do
    it 'redirects to destination based on vanity_path' do
      shortened_url = create :shortened_url
      get :visit, params: { vanity_path: shortened_url.vanity_path }
      expect(response).to redirect_to( shortened_url.destination ) 
    end

    it 'redirects to homepage if vanity_path does not correspond to shortened url' do
      get :visit, params: { vanity_path: 'garbage' }
      expect(response).to redirect_to( '/' ) 
    end
  end

end
