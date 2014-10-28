require 'rails_helper'
require 'capybara/rails'

feature "Spam" do

  scenario "User can mark a rant as spam" do
    create_user_with_rant
    sign_in
    expect(page).to have_content "something fun"
    click_on "Lorem ipsum dolor"
    expect(page).to have_content "by Jim"
    click_on "Spam"
    expect(Spam.last.rant_id).to eq(Rant.find_by(subject: "something fun").id)
  end

  scenario "If user marks a rant as spam, it disappears from dashboard" do
    create_user_with_rant
    sign_in
    expect(page).to have_content "something fun"
    click_on "Lorem ipsum dolor"
    expect(page).to have_content "by Jim"
    click_on "Spam"
    expect(page).to have_no_content "something fun"
  end

  scenario "If rant is deleted, associated spam records are deleted" do
    create_user_with_rant
    sign_in
    rant = Rant.find_by(subject: "something fun")
    expect(page).to have_content "something fun"
    click_on "Lorem ipsum dolor"
    expect(page).to have_content "by Jim"
    click_on "Spam"
    Rant.find_by(subject: "something fun").destroy
    expect(Spam.find_by(rant_id: rant.id)).to eq(nil)
  end

  scenario "If user is deleted, associated spam records are deleted" do
    create_user_with_rant
    sign_in
    user = User.find_by(username: "Jim")
    expect(page).to have_content "something fun"
    click_on "Lorem ipsum dolor"
    expect(page).to have_content "by Jim"
    click_on "Spam"
    User.find_by(username: "Jim").destroy
    expect(Spam.find_by(user_id: user.id)).to eq(nil)
  end

end