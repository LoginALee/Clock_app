class UserMailer < ApplicationMailer
  def alarm_activated
    @user = params[:user]
    @alarm = params[:alarm]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Alarm activated')
  end
end
