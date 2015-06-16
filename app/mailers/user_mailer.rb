class UserMailer < ApplicationMailer

  default from: "support@mg.pikwon.com"

  def welcome_email(user)

    @user = user
    mail(to: @user.email, subject: 'Welcome to Pikwon!')

  end

end
