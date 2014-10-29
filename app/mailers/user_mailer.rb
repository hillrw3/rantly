class UserMailer < ActionMailer::Base
  default from: "admin@rantly.com"

  def registration_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: "Welcome to Rantly!")
  end

end
