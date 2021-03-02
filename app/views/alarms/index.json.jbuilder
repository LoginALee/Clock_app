json.array! @alarms do |alarm|
  json.id alarm.id
  time = "#{Time.new.strftime('%Y/%m/%d')} #{alarm.time.strftime('%H:%M:%S')}"
  json.time time
  json.days alarm.days
end
