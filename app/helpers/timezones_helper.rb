module TimezonesHelper
  def time_zone_format(time_zone)
    ActiveSupport::TimeZone[time_zone]
  end

  def time_zone_info(time_zone)
    ActiveSupport::TimeZone[time_zone].now
  end
end
