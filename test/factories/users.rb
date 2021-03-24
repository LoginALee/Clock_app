FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    after(:build) do |user|
      user.avatar.attach(io: File.open('spec/fixtures/perfil.jpeg'), filename: 'perfil.jpeg',
                         content_type: 'image/jpeg')
    end
  end
end
