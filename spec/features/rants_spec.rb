require 'rails_helper'
require 'capybara/rails'

feature "Rants" do

  def sign_in
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
    click_button "Login"
    expect(page).to have_content "ROB HILL"
  end

  scenario "user can post a rant" do
    sign_in
    fill_in "A rant about:", with: "Pugs"
    fill_in "Rant", with: "Lorem ipsum dolor sit amet, iusto adipisci"
    click_button "RANT"
    expect(page).to have_content "Feel better? Rant posted."
  end


end