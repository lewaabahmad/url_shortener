require 'rails_helper'

RSpec.feature 'Create Shortened URL', :type => :feature do

  scenario 'User enters valid destination url' do
    visit '/'

    fill_in 'Destination', :with => 'http://www.google.com'
    click_button 'Create Shortened URL'

    expect(page).to have_text( 'Successfully created Shortened URL.' )
  end

  scenario 'User enters invalid destination url' do
    visit '/'

    fill_in 'Destination', :with => 'garbage'
    click_button 'Create Shortened URL'

    expect(page).to have_text( 'URL entered is invalid.' )
  end
end
