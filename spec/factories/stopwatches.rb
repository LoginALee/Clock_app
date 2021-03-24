FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :stopwatch do
    time { '00:10:30' }
    name { Faker::Lorem.sentence }
    laps { ["00:01:00", "00:01:30", "00:02:00"] }
    user
  end
end
