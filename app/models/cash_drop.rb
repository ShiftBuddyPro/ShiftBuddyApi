class CashDrop < ApplicationRecord
  belongs_to :shift

  default_scope { order(created_at: :desc) }
end
