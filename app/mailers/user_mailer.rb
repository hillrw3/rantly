class UserMailer < ActionMailer::Base
  default from: "admin@rantly.com"

  def confirmation_email(user)
    @user = user
    Rails.env.production? ? @url = 'http://example.com/login' : @url = 'http://example.com/login'
    mail(to: @user.email, subject: "Welcome to Rantly!")
  end

end
