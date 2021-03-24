FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :alarm do
    days { %w[Monday Wednesday Friday] }
    time { '2021-03-17 00:39:28' }
    user
  end
end
