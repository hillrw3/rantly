require 'rails_helper'
require 'capybara/rails'

feature "Admin Users" do

  scenario "Admin can see a list of all users" do
    create_admin
    create_user
    create_user2
    login_admin
    click_on "Users"
    expect(page).to have_content "Rob"
    expect(page).to have_content "Puff"
  end

end