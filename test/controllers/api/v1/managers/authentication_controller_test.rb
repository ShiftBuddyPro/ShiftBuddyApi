require 'test_helper'

class Api::V1::Managers::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :password, :business

  setup do
    @password = Faker::Internet.password
    @manager = create :manager, password: password
    @business = create :business, manager: manager
  end

  test 'should authenticate manager' do
    post '/api/v1/managers/authenticate', params: authentication_params
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
      has :meta do
        has :auth_token
      end
    end
  end

  private

  def authentication_params
    { email: manager.email, password: password }
  end
end
