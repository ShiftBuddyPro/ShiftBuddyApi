class ChangeSheetSerializer < ApplicationSerializer
  attributes :id,
             :start_pennies,
             :start_nickels,
             :start_dimes,
             :start_quarters,
             :start_ones,
             :start_fives,
             :start_tens,
             :start_twenties,
             :end_pennies,
             :end_nickels,
             :end_dimes,
             :end_quarters,
             :end_ones,
             :end_fives,
             :end_tens,
             :end_twenties
end
