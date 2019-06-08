require 'test_helper'

class Api::V1::InventoryItemsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :inventory_item, :shift

  setup do
    @shift = create :shift
    @inventory_item = create :inventory_item, shift: shift
  end

  test 'should show all inventory_items' do
    get '/api/v1/inventory_items'
    assert_response :success
  end

  test 'should show inventory_item' do
    get "/api/v1/inventory_items/#{inventory_item.id}"
    assert_response :success
  end

  test 'should update inventory_item' do
    put "/api/v1/inventory_items/#{inventory_item.id}",
        params: inventory_item_params
    assert_response :success
  end

  test 'should delete inventory_item' do
    assert_difference 'InventoryItem.count', -1 do
      delete "/api/v1/inventory_items/#{inventory_item.id}"
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
