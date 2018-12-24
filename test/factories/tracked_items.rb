FactoryBot.define do
  factory :tracked_item do
    name { Faker::Beer.name }
    manager
  end
end
