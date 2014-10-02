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

def create_user_with_rant
  user = User.create!(username: "Jim", password: "password", first_name: "Jim", last_name: "Jam", bio: "I am a person who enjoys a good rant")
  user.rants.create!(subject: "something fun", rant: "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci")
end