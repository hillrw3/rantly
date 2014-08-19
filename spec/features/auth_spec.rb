require 'rails_helper'
require 'capybara/rails'

feature 'User creation and login' do

  scenario "User sees splash page when not logged in" do
    visit '/'
    expect(page).to have_content("Rantly")

  end


end