FactoryBot.define do
  factory :manager do
    email { Faker::Internet.email }
    name  { 'jeff' }
  end
end
