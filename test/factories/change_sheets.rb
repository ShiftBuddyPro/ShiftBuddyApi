FactoryBot.define do
  factory :change_sheet do
    start_pennies { Faker::Number.number(1) }
    start_nickels { Faker::Number.number(1) }
    start_dimes { Faker::Number.number(1) }
    start_quarters { Faker::Number.number(1) }
    start_ones { Faker::Number.number(1) }
    start_fives { Faker::Number.number(1) }
    start_tens { Faker::Number.number(1) }
    start_twenties { Faker::Number.number(1) }
    end_pennies { Faker::Number.number(1) }
    end_nickels { Faker::Number.number(1) }
    end_dimes { Faker::Number.number(1) }
    end_quarters { Faker::Number.number(1) }
    end_ones { Faker::Number.number(1) }
    end_fives { Faker::Number.number(1) }
    end_tens { Faker::Number.number(1) }
    end_twenties { Faker::Number.number(1) }
    shift
  end
end
