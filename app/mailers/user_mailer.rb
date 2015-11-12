class UserMailer < ApplicationMailer
  default from: 'mdickson@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "http://localhost3000/login"
    mail(to: @user.email, subject: 'Welcome to the Wiki!')
  end
end
