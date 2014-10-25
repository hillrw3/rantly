require 'rails_helper'
require 'capybara/rails'

feature "Search" do

  scenario "User can search by last name" do
    create_user_with_rant
    sign_in
    click_on "Search"
    fill_in "search", with: "Jam"
    click_on "SEARCH"
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
  end

  scenario "User can search by first name" do
    create_user_with_rant
    sign_in
    click_on "Search"
    fill_in "search", with: "Jim"
    click_on "SEARCH"
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
  end

  scenario "User can search by username" do
    create_user_with_rant
    sign_in
    click_on "Search"
    fill_in "search", with: "Jim"
    click_on "SEARCH"
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
  end

  scenario "User can search by rant subject" do
    create_user_with_rant
    sign_in
    click_on "Search"
    fill_in "search", with: "something fun"
    click_on "SEARCH"
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
  end

  scenario "User can search by rant" do
    create_user_with_rant
    sign_in
    click_on "Search"
    fill_in "search", with: "Lorem"
    click_on "SEARCH"
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
  end

end