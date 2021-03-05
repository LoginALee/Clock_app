class DailyReportJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    @users = User.all

    @users.each do |user|
      UserMailer.with(user: user).daily_report.deliver_now
    end
  end
end
