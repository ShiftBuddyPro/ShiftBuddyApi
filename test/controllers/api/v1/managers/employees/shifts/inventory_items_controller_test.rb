require 'test_helper'

class Api::V1::Managers::Employees::Shifts::InventoryItemsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :employee, :shift, :inventory_item

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
    @inventory_item = create :inventory_item, shift: shift
    sign_in employee
  end

  test 'should get shifts Inventory items' do
    get "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{
          shift.id
        }/inventory_items"
    assert_response :success
    assert_json(@response.body) do
      item 0 do
        has :id, inventory_item.id
        has :start_amount, inventory_item.start_amount
        has :end_amount, inventory_item.end_amount
        has :name, inventory_item.name
        has :shift_id, shift.id
        has :created_at
        has :updated_at
      end
    end
  end

  test 'should create inventory item' do
    assert_difference 'InventoryItem.count' do
      post "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{
             shift.id
           }/inventory_items",
           params: inventory_item_params
    end
    assert_response :success
  end

  private

  def inventory_item_params
    {
      inventory_item: {
        name: Faker::Beer.name,
        start_amount: Faker::Number.number(2),
        end_amount: Faker::Number.number(2),
        shift_id: shift.id
      }
    }
  end
end
