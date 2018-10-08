require 'test_helper'

class ManagersControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager
  setup do
    @manager = create :manager
  end

  test 'should create manager' do
    assert_changes 'Manager.count' do
      post '/api/v1/managers', params: manager_params
    end
  end

  test 'should show manager' do
    get "/api/v1/managers/#{manager.id}"
    debugger
    assert_response :success
  end

private

  def manager_params
    {
      manager: {
        name: 'john',
        email: Faker::Internet.email
      }
    }
  end
end
