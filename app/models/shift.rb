class Shift < ApplicationRecord
  after_create :set_inventory_items, :add_change_sheet
  default_scope { order(created_at: :desc) }

  belongs_to :employee

  has_many :notes
  has_many :checks
  has_many :cash_drops
  has_many :paid_outs
  has_many :inventory_items
  has_one :change_sheet

  enum status: %i[active completed]

  def set_inventory_items
    employee.manager.tracked_items.each do |item|
      InventoryItem.new(name: item.name, start_amount: 0, shift_id: id).save
    end
  end

  def completed!
    super
  end

  def add_change_sheet
    change_types = %w[pennies nickels dimes quarters ones fives tens twenties]
    prefixes = %w[start end]
    change_sheet = ChangeSheet.new(shift_id: id)
    prefixes.each do |prefix|
      change_types.each do |change_type|
        change_sheet.send("#{prefix}_#{change_type}=", 0)
      end
    end
    change_sheet.save
  end

  def recent_activities
    (notes + paid_outs + checks).sort_by(&:created_at).reverse!.map(
      &:to_activity
    )
  end
end
