require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  attr_reader :manager, :employee, :tracked_item

  setup do
    @manager = create :manager
    @employee = create :employee, manager_id: manager.id
    @tracked_item = create :tracked_item, manager_id: manager.id
  end

  test 'should set inventory items based on manager tracked items' do
    shift = create :shift, employee_id: employee.id
    assert shift.inventory_items.first
    item = shift.inventory_items.first
    assert_equal tracked_item.name, item.name
    assert_equal 0, item.start_amount
  end

  test 'should create change sheet after creation' do
    shift = create :shift

    assert shift.change_sheet
  end
end
