class AlarmPresenter < SimpleDelegator
  def initialize(alarm)
    @alarm = alarm
  end

  def time_with_hour_minutes
    @alarm.time.strftime('%H:%M')
  end

  def time_with_hour_minutes_seconds
    @alarm.time.strftime('%H:%M:%S')
  end

  def days_abbreviations
    @alarm.days.map { |day| day[0...3] }
  end

  def days_inline
    @alarm.days.join(', ')
  end
end
