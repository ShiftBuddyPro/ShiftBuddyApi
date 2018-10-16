FactoryBot.define do
  factory :paid_out do
    company { Faker::Company.name }
    amount { Faker::Number.number(2) }

    shift
  end
end
