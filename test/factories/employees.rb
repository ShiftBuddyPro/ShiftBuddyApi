FactoryBot.define do
  factory :employee do
    name { Faker::Name.first_name }

    manager
  end
end
