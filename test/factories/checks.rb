FactoryBot.define do
  factory :check do
    number { 1 }
    company { "MyString" }
    amount { 1.5 }
    shift { nil }
  end
end
