require 'rails_helper'
require 'capybara/rails'

feature 'User creation and login' do

  scenario "User sees splash page when not logged in" do
    visit '/'
    expect(page).to have_content("Rantly")
  end

  scenario "User can join and login" do
    visit '/'
    click_button "Join"
    expect(page).to have_content("Register")
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "1234"
    fill_in "First name", with: "Rob"
    fill_in "First name", with: "Rob"
    fill_in "Last name", with: "Hill"
    fill_in "Bio", with: "Just a simple fellow who likes to Rant"
    click_on "Register"
    expect(page).to have_content "Thanks for registering.  Get to ranting!"

    click_link "Login"
    expect(page).to have_content "Login"
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "1234"
    click_on "Login"
    expect(page).to have_content "Rob Hill"
  end

end