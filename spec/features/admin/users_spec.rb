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
    expect(page).to have_content "rob@example.com"
  end

  scenario "Disabled Users will have a ✓ in the disabled column" do
    create_admin
    create_disabled_user
    login_admin
    click_on "Users"
    expect(page).to have_content "✓"
    expect(page).to have_content "Puff"
  end

  scenario "Admin can disable a user" do
    create_admin
    create_user
    login_admin
    click_on "Users"
    expect(page).to have_no_content "✓"
    click_on "Disable"
    expect(page).to have_content "✓"
  end

  scenario "Admin can sorts users by number of rants" do
    create_admin
    create_user
    create_user_with_rant
    login_admin
    click_on "Users"
    within("tbody") do
      expect(first("tr")).to have_content "Rob"
    end
    click_on "Number of Rants"
    within("tbody") do
      expect(first("tr")).to have_content "Jim"
    end
  end

end