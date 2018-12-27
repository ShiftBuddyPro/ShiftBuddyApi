FactoryBot.define do
  factory :change_sheets do
    start_pennies { Faker::Number.number(2) }
    start_nickels { Faker::Number.number(2) }
    start_dimes { Faker::Number.number(2) }
    start_quarters { Faker::Number.number(2) }
    start_ones { Faker::Number.number(2) }
    start_fives { Faker::Number.number(2) }
    start_tens { Faker::Number.number(2) }
    start_twenties { Faker::Number.number(2) }
    end_pennies { Faker::Number.number(2) }
    end_nickels { Faker::Number.number(2) }
    end_dimes { Faker::Number.number(2) }
    end_quarters { Faker::Number.number(2) }
    end_ones { Faker::Number.number(2) }
    end_fives { Faker::Number.number(2) }
    end_tens { Faker::Number.number(2) }
    end_twenties { Faker::Number.number(2) }
    shift
  end
end
