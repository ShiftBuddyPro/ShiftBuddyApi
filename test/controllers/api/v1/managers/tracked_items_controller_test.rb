require 'test_helper'

class Api::V1::Managers::TrackedItemsControllerTest < ActionDispatch::IntegrationTest
  include AssertJson
  attr_reader :manager, :tracked_item, :tracked_item2

  setup do
    @manager = create :manager
    @tracked_item = create :tracked_item, manager_id: manager.id
    @tracked_item2 = create :tracked_item, manager_id: manager.id
  end

  test 'should get all of managers tracked_items' do
    get "/api/v1/managers/#{manager.id}/tracked_items"
    assert_response :success
    assert_json(response.body) do
      item 0 do
        has :id, tracked_item.id
        has :name, tracked_item.name
        has :manager_id, manager.id
      end
      item 1 do
        has :id, tracked_item2.id
        has :name, tracked_item2.name
        has :manager_id, manager.id
      end
    end
  end

  test 'should create tracked item for manager' do
    assert_difference('manager.tracked_items.size') do
      post "/api/v1/managers/#{manager.id}/tracked_items", params: tracked_item_params
    end
  end

  test 'should destroy tracked_item' do
    assert_difference('manager.tracked_items.size', -1) do
      delete "/api/v1/managers/#{manager.id}/tracked_items/#{tracked_item.id}"
    end
    assert_response :success
  end

private

  def tracked_item_params
    {
      tracked_item: {
        name: Faker::Beer.name,
        manager_id: manager.id
      }
    }
  end
end
