FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :stopwatch do
    time { Helpers::Factories.time_rand }
    name { Faker::Lorem.sentence }
    laps { Helpers::Factories.laps_rand }
    user
  end
end
