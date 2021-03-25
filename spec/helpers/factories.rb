module Helpers
  module Factories
    extend self

    def full_date_rand(from = 0.0, to = Time.now)
      Time.at(from + rand * (to.to_f - from.to_f))
    end

    def time_rand
      date = full_date_rand
      date.strftime('%H:%M:%S')
    end

    def days_rand
      days = []
      names = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
      nums = numbers_rand
      nums.each do |num|
        days << names[num]
      end
      days
    end

    def timezone_rand
      number = rand(0..151)
      ActiveSupport::TimeZone.all[number].name
    end

    def numbers_rand
      nums = []
      5.times do
        num = rand(0..6)
        nums << num unless nums.include?(num)
      end
      nums.sort
    end

    def laps_rand
      laps = []
      num = rand(1..9)
      num.times do
        time = time_rand
        laps << time
      end
      laps
    end
  end
end
