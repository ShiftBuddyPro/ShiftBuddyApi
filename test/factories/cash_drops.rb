FactoryBot.define do
  factory :cash_drop do
    amount { Faker::Number.number(2) }
    number { Faker::Number.number(2) }

    shift
  end
end
