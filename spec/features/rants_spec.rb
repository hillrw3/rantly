require 'rails_helper'
require 'capybara/rails'

feature "Rants" do

  def sign_in
    visit '/'
    click_button "Join"
    expect(page).to have_content("Register")
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "password"
    fill_in "First name", with: "Rob"
    fill_in "Last name", with: "Hill"
    fill_in "Bio", with: "Just a simple fellow who likes to Rant"
    click_on "REGISTER"
    expect(page).to have_content "Thanks for registering.  Get to ranting!"

    click_link "Login"
    expect(page).to have_content "Login"
    fill_in "Username", with: "Rob"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_content "ROB HILL"
  end

  scenario "user can post a rant" do
    sign_in
    fill_in "A rant about:", with: "Pugs"
    fill_in "Rant", with: "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    click_button "RANT"
    expect(page).to have_content "Feel better? Rant posted."
    expect(page).to have_content "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
  end

  scenario "user can delete a rant he/she posted" do
    sign_in
    fill_in "A rant about:", with: "Pugs"
    fill_in "Rant", with: "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    click_button "RANT"
    expect(page).to have_content "Feel better? Rant posted."
    expect(page).to have_content "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    click_link "Delete"
    expect(page).to have_no_content "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    expect(page).to have_content "Your rant was deleted."
  end

  scenario "user can views rants by other users and follow users" do
    sign_in
    fill_in "A rant about:", with: "Pugs"
    fill_in "Rant", with: "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    click_button "RANT"
    expect(page).to have_content "Feel better? Rant posted."
    expect(page).to have_content "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    click_on "LOGOUT"

    click_button "Join"
    expect(page).to have_content("Register")
    fill_in "Username", with: "Jim"
    fill_in "Password", with: "password"
    fill_in "First name", with: "Jim"
    fill_in "Last name", with: "Jam"
    fill_in "Bio", with: "Just a simple fellow who likes to Rant"
    click_on "REGISTER"
    expect(page).to have_content "Thanks for registering.  Get to ranting!"

    click_link "Login"
    expect(page).to have_content "Login"
    fill_in "Username", with: "Jim"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content "Latest Rants"
    expect(page).to have_content "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    click_on "Follow"
    click_on "Following"
    expect(page).to have_content "Rob"

    click_on "Dashboard"
    click_on "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    expect(page).to have_content "Pugs"
    expect(page).to have_content "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
  end

  scenario "User can favorite a rant" do
    create_user_with_rant
    sign_in
    expect(page).to have_content "something fun"
    click_on "0 - Favorite"
    click_on "Favorites"
    expect(page).to have_content "something fun"
    expect(page).to have_content "Unfavorite"
  end

end