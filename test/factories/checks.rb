FactoryBot.define do
  factory :check do
    number { Faker::Number.number(4) }
    company { Faker::Company.name }
    amount { Faker::Commerce.price }

    shift
  end
end
