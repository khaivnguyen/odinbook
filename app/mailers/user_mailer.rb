class UserMailer < ApplicationMailer
  default from: 'khaivnguyen02@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://odin.com/'
    mail(to: @user.email, subject: 'Welcome to Odinbook')
  end
end
