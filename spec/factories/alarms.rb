FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :alarm do
    days { Helpers::Factories.days_rand }
    time { Helpers::Factories.full_date_rand }
    user
  end
end
