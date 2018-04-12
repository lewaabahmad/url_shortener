require 'rails_helper'

RSpec.feature 'Create Shortened URL', :type => :feature do

  let ( :shortened_url ) { create :shortened_url }

  scenario 'User visits valid shortned url' do
    visit shortened_url.vanity_url
    expect( page ).to have_current_path( "https://www.dia.com/" )
  end

  scenario 'User enters invalid destination url' do
    visit "#{ shortened_url.vanity_url }garbage"
    expect(page).to have_text( 'Shortened URL does not exist' )
  end
end
