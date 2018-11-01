FactoryBot.define do
  factory :inventory_item do
    name { Faker::Beer.name }
    start_amount { Faker::Number.number(2) }
    end_amount { Faker::Number.number(2) }

    shift
  end
end
