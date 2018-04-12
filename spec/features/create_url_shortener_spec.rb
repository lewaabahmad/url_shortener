require 'rails_helper'

RSpec.feature 'URL Shortener', :type => :feature do

  scenario 'User creates a new shortened url' do
    visit '/'

    fill_in 'Destination', :with => 'http://www.google.com'
    click_button 'Create Shortened URL'

    expect(page).to have_text('Success!')
  end
end
