require 'rails_helper'
require 'capybara/rails'

feature "Followers" do

  scenario "Users can follow other users" do
    create_user_with_rant
    sign_in
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
    click_on "Follow"
    expect(page).to have_content "Unfollow"
  end

  scenario "Users can unfollow other users" do
    create_user_with_rant
    sign_in
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
    click_on "Follow"
    expect(page).to have_content "Unfollow"
    click_on "Following"
    expect(page).to have_content "Jim"
    click_on "Unfollow"
    expect(page).to have_no_content "Jim"
  end

  scenario "Users can view who they follow" do
    create_user_with_rant
    create_user2
    sign_in
    Follower.create!(user_id: User.find_by_username("Rob").id, following: User.find_by_username("Puff").id)
    expect(page).to have_content "Jim"
    expect(page).to have_content "something fun"
    click_on "Follow"
    expect(page).to have_content "Unfollow"
  end

end