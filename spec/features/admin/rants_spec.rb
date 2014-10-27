require 'rails_helper'
require 'capybara/rails'

feature "Admin Rants" do

  scenario "Admin can see a list of rants" do
    create_admin
    create_user_with_rant
    login_admin
    click_on "Rants"
    expect(page).to have_content "Name"
    expect(page).to have_content "Jim Jam"
    expect(page).to have_content "jim@example.com"
    expect(page).to have_content "something fun"
  end

end