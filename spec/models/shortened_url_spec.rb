require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do

  let( :shortened_url ) { build :shortened_url }

  describe 'is valid' do
    it 'when instantiated with a proper URL' do
      expect( shortened_url.valid? ).to be true
    end
  end

  describe 'is invalid' do
    it 'when instantiated with an improper URL' do
      invalid_shortened_url = build :shortened_url, destination: "garbage" 
      expect( invalid_shortened_url.valid? ).to be false
    end
  end

  describe 'after creation' do
    before do
      shortened_url.save
    end

    it 'generates a vanity_path' do
      expect( shortened_url.vanity_path ).not_to be nil
    end

    describe '.vanity_url' do
      it 'returns the shortened url' do
        expect( shortened_url.vanity_url ).to eq "http://localhost:3000/#{ shortened_url.vanity_path }"
      end
    end
  end
end
