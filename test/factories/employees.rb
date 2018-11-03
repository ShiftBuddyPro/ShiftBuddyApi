FactoryBot.define do
  factory :employee do
    name { Faker::Name.first_name }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    manager
  end
end
