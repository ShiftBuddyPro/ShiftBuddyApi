class ShiftSerializer < ApplicationSerializer
  attribute :id
  attribute :created_at

  attribute :employee_id do |shift|
    shift.employee.id
  end

  attribute :employee_name do |shift|
    shift.employee.name
  end

  has_many :notes
  has_many :checks
  has_many :cash_drops
  has_many :paid_outs
  has_many :inventory_items
  has_one :change_sheet
end
