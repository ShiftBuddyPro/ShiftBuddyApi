FactoryBot.define do
  factory :note do
    title { Faker::GreekPhilosophers.name }
    message { Faker::GreekPhilosophers.quote }
    shift
  end
end
