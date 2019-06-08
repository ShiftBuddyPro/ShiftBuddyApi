FactoryBot.define do
  factory :manager do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    password { Faker::Internet.password }
  end
end
