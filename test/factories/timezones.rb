FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :timezone do
    name { 'Guadalajara' }
    user
  end
end
