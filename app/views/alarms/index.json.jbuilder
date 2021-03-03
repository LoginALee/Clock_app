json.array! @alarms do |alarm|
  json.id alarm.id
  json.time "#{Time.new.strftime('%Y/%m/%d')} #{alarm.time.strftime('%H:%M:%S')}"
  json.days alarm.days
end
