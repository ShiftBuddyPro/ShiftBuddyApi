class Shift < ApplicationRecord
  belongs_to :employee

  has_many :notes
  has_many :checks
  has_many :cash_drops
  has_many :paid_outs
  has_many :inventory_items
end
