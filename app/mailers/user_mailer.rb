class UserMailer < ApplicationMailer
  def alarm_activated
    @user = params[:user]
    @alarm = params[:alarm]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Alarm activated')
  end

  def daily_report
    @user = params[:user]
    @stopwatches = stopwatch_records(@user)
    @alarms = alarms_for_tomorrow(@user)
    mail(to: @user.email, subject: 'Daily report')
  end

  def stopwatch_records(user)
    user.stopwatches.where('DATE(created_at) = ?', Date.today)
  end

  def alarms_for_tomorrow(user)
    user.alarms.where('days like ?', "%#{Date.tomorrow.strftime('%A')}%")
  end
end
