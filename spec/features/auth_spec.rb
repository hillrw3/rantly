require 'rails_helper'
require 'capybara/rails'

feature 'User creation and login' do

  def sign_in
    visit '/'
    click_on "Join"
    expect(page).to have_content("Register")
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "password"
    fill_in "First name", with: "Rob"
    fill_in "First name", with: "Rob"
    fill_in "Last name", with: "Hill"
    fill_in "Bio", with: "Just a simple fellow who likes to Rant"
    click_on "Register"
    expect(page).to have_content "Thanks for registering.  Get to ranting!"

    click_link "Login"
    expect(page).to have_content "Login"
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_content "ROB HILL"
  end

  scenario "User sees splash page when not logged in" do
    visit '/'
    expect(page).to have_content("Rantly")
  end

  scenario "User can join and login" do
    sign_in
  end

end