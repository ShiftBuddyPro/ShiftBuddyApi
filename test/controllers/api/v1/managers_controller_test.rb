require 'test_helper'

class Api::V1::ManagersControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :business

  setup do
    @manager = create :manager
    @business = create :business, manager: manager
  end

  test 'should create manager' do
    assert_changes 'Manager.count' do
      post '/api/v1/managers', params: manager_params
    end
  end

  focus
  test 'should show manager' do
    get "/api/v1/managers/#{manager.id}"
    assert_json(@response.body) do
      has :data do
        has :id, manager.id.to_s
        has :type, 'manager'
        has :attributes do
          has :name, manager.name
        end
      end
      has :included do
        has_length_of 1
        item 0 do
          has :id, business.id.to_s
          has :type, 'business'
          has :attributes do
            has :name, business.name
            has :address1, business.address1
            has :city, business.city
            has :state, business.state
            has :zip_code, business.zip_code
          end
        end
      end
    end
    assert_response :success
  end

  test 'should update manager' do
    put "/api/v1/managers/#{manager.id}", params: manager_params
    assert_response :success
  end

  test 'should delete manager' do
    assert_difference 'Manager.count', -1 do
      delete "/api/v1/managers/#{manager.id}"
    end
    assert_response :success
  end

  private

  def manager_params
    password = Faker::Internet.password

    {
      manager: {
        name: Faker::Name.first_name,
        email: Faker::Internet.email,
        password: password,
        password_confirmation: password
      }
    }
  end
end
