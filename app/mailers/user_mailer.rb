class UserMailer < ApplicationMailer
  def forget_password_email(user, token)
    @user = user
    @token = token
    mail(to: @user.email, subject: 'Reset your password')
  end
end
