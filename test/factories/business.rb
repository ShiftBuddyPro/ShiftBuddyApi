FactoryBot.define do
  factory :business do
    name { Faker::Company.name }
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip[0..4] }

    manager
  end
end
