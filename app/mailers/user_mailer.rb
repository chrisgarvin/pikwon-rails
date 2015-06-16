class UserMailer < ApplicationMailer

  default from: "support@pikwon.com"

  def welcome_email(user)

    @user = user
    mail(to: @user.email, subject: 'Welcome to Pikwon!')

  end

end
