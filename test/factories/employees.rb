FactoryBot.define do
  factory :employee do
    name { Faker::Name.first_name }
    association :manager, factory: :manager
  end
end
