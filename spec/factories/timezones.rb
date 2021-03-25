FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :timezone do
    name { Helpers::Factories.timezone_rand }
    user
  end
end
