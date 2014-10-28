def sign_in
  visit '/'
  click_button "Join"
  expect(page).to have_content("Register")
  fill_in "Username", with: "Rob"
  fill_in "Password", with: "password"
  fill_in "First name", with: "Rob"
  fill_in "Last name", with: "Hill"
  fill_in "Email", with: "rob@example.com"
  fill_in "Bio", with: "Just a simple fellow who likes to Rant"
  attach_file "Avatar", "/Users/Rob/gSchoolWork/rantly/public/uploads/user/avatar/16/gSchool-photo.JPG"
  click_on "REGISTER"
  expect(page).to have_content "Thanks for registering.  Get to ranting!"

  click_link "Login"
  expect(page).to have_content "Login"
  fill_in "Username", with: "Rob"
  fill_in "Password", with: "password"
  click_button "Login"
  expect(page).to have_content "ROB HILL"
end

def login
  visit '/'
  click_on 'Login'
  fill_in 'Username', with: 'Rob'
  fill_in 'Password', with: 'password'
  click_button 'Login'
end

def login_admin
  visit '/'
  click_on 'Login'
  fill_in 'Username', with: 'admin'
  fill_in 'Password', with: 'password'
  within('.form') do
    click_on 'Login'
  end
end


def create_user_with_rant
  user = User.create!(username: "Jim", password: "password", first_name: "Jim", last_name: "Jam", bio: "I am a person who enjoys a good rant", email: "jim@example.com")
  user.rants.create!(subject: "something fun", rant: "Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci")
end

def create_user_with_markdown_rant
  user = User.create!(username: "Jim", password: "password", first_name: "Jim", last_name: "Jam", bio: "I am a person who enjoys a good rant", email: "jim@example.com")
  user.rants.create!(subject: "something fun", rant: "*Lorem* ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci Lorem ipsum dolor sit amet, iusto adipisci")
end

def create_user
  user = User.create!(username: "Rob",
                      password: "password",
                      first_name: "Rob",
                      last_name: "Hill",
                      bio: "Just a simple fellow who likes to Rant",
                      email: "rob@example.com",
                      avatar: "hello.png")
end

def create_user2
  User.create!(username: "Puff", password: "password", first_name: "Puff", last_name: "theDog", bio: "I am a DOG who enjoys a good rant", email: "puff@example.com")
end

def create_disabled_user
  User.create!(username: "Puff", password: "password", first_name: "Puff", last_name: "theDog", bio: "I am a DOG who enjoys a good rant", email: "puff@example.com", enabled: false)
end

def create_admin
  User.create!(username: "admin", password: "password", first_name: "admin", last_name: "admin", bio: "Dont mind me.  I'm just administrating", admin: true)
end