class Check < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  default_scope { order(created_at: :desc) }

  belongs_to :shift

  def to_activity
    "#{shift.employee.name} just wrote a check to #{company} for #{
      number_to_currency(amount)
    }"
  end
end
