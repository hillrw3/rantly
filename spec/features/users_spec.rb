require 'rails_helper'
require 'capybara/rails'

feature "Users specs" do
  #
  # def sign_in
  #   visit '/'
  #   click_button "Join"
  #   expect(page).to have_content("Register")
  #   fill_in "Username", with: "Rob"
  #   fill_in "Password", with: "password"
  #   fill_in "First name", with: "Rob"
  #   fill_in "Last name", with: "Hill"
  #   attach_file "Avatar", "#{Rails.root}/public/uploads/user/avatar/16/gSchool-photo.JPG"
  #   fill_in "Bio", with: "Just a simple fellow who likes to Rant"
  #   click_on "REGISTER"
  #   expect(page).to have_content "Thanks for registering.  Get to ranting!"
  #
  #   click_link "Login"
  #   expect(page).to have_content "Login"
  #   fill_in "Username", with: "Rob"
  #   fill_in "Password", with: "password"
  #   click_button "Login"
  #   expect(page).to have_content "ROB HILL"
  # end

  scenario "user can click on another user's name to see his profile and can follow him" do
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
    attach_file "Avatar", "#{Rails.root}/public/uploads/user/avatar/16/gSchool-photo.JPG"
    click_on "REGISTER"
    expect(page).to have_content "Thanks for registering.  Get to ranting!"

    click_link "Login"
    expect(page).to have_content "Login"
    fill_in "Username", with: "Jim"
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Rob"
    expect(page).to have_content "Rob"
    expect(page).to have_content "Just a simple fellow who likes to Rant"
    expect(page).to have_content "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci"
    click_on "Follow"
    expect(page).to have_content "You're now following Rob"
  end


end