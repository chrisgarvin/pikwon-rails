class UserMailer < ApplicationMailer
  
  def welcome_email(user)
    default from: "support@pikwon.com"

    @user = user
    mail(to: @user.email, subject: 'Welcome to Pikwon!')

  end

end
