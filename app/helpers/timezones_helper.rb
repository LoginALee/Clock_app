module TimezonesHelper
  def time_zone_format(time_zone)
    ActiveSupport::TimeZone[time_zone].to_s
  end

  def time_zone_info(time_zone)
    ActiveSupport::TimeZone[time_zone].now.to_s
  end
end
