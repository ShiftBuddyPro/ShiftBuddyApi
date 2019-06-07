class CashDrop < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  p
  belongs_to :shift

  default_scope { order(created_at: :desc) }

  def to_activity
    "#{shift.employee.name} just made a cash drop for #{
      number_to_currency(amount)
    } in envelope ##{number}"
  end
end
