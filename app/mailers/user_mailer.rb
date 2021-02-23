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
    @stopwatches = []

    user.stopwatches.each do |stopwatch|
      @stopwatches.push(stopwatch) if stopwatch.created_at.strftime('%Y-%m-%d') == Date.today.to_s
    end
    @stopwatches
  end

  def alarms_for_tomorrow(user)
    @alarms = []
    user.alarms.each do |alarm|
      @alarms.push(alarm) if alarm.days.include?(Date.tomorrow.strftime('%A'))
    end
    @alarms
  end
end
