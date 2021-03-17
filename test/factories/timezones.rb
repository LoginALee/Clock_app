FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :timezone do
    name { Faker::Lorem.sentence }
    user
  end
end
