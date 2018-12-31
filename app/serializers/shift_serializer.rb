class ShiftSerializer < ApplicationSerializer
  attribute :id

  has_many :notes
  has_many :checks
  has_many :cash_drops
  has_many :paid_outs
  has_many :inventory_items
  has_one :change_sheet

end
