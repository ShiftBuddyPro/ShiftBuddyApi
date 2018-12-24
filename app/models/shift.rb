class Shift < ApplicationRecord
  after_create :set_inventory_items

  belongs_to :employee

  has_many :notes
  has_many :checks
  has_many :cash_drops
  has_many :paid_outs
  has_many :inventory_items

  def set_inventory_items
    employee.manager.tracked_items.each do |item|
      InventoryItem.new(name: item.name,
                        start_amount: 0,
                        shift_id: id).save
    end
  end
end
