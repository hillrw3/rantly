require 'rails_helper'
require 'capybara/rails'

feature 'User creation and login' do

  scenario "User sees splash page when not logged in" do
    visit '/'
    expect(page).to have_content("Rantly")
  end

  scenario "User can join and login" do
    sign_in
  end

  scenario "username must be unique" do
    sign_in
    click_on "LOGOUT"
    click_on "Join"
    expect(page).to have_content("Register")
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "password"
    fill_in "First name", with: "Rob"
    fill_in "First name", with: "Rob"
    fill_in "Last name", with: "Hill"
    fill_in "Bio", with: "Just a simple fellow who likes to Rant"
    click_on "REGISTER"
    expect(page).to have_content "Username has already been taken"
  end

  scenario "user must enter username.  password must also be at least 8 characters" do
    visit '/'
    click_on "Join"
    expect(page).to have_content("Register")
    fill_in "Username", with: ""
    fill_in "Password", with: "pass"
    fill_in "First name", with: "Rob"
    fill_in "First name", with: "Rob"
    fill_in "Last name", with: "Hill"
    fill_in "Bio", with: "Just a simple fellow who likes to Rant"
    click_on "REGISTER"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Password is too short"
  end

  scenario "user sees error if incorrect login info is provided" do
    visit '/'
    click_button "Join"
    expect(page).to have_content("Register")
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "password"
    fill_in "First name", with: "Rob"
    fill_in "Last name", with: "Hill"
    fill_in "Email", with: "rob@example.com"
    fill_in "Bio", with: "Just a simple fellow who likes to Rant"
    attach_file("Avatar", "/Users/Rob/gSchoolWork/rantly/public/uploads/user/avatar/16/gSchool-photo.JPG")
    click_on "REGISTER"
    expect(page).to have_content "Thanks for registering.  Get to ranting!"

    click_link "Login"
    expect(page).to have_content "Login"
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "pass"
    click_button "Login"
    expect(page).to have_content "Login failed"
  end

  scenario "user sees flash message & cannot login if disabled" do
    create_disabled_user
    visit '/'
    click_link "Login"
    expect(page).to have_content "Login"
    fill_in "Username", with: "Puff"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end