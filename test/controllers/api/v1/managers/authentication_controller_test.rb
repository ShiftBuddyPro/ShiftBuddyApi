require 'test_helper'

class Api::V1::Managers::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :password, :business

  setup do
    @password = Faker::Internet.password
    @manager = create :manager, password: password
    @business = create :business, manager: manager
  end

  focus
  test 'should authenticate manager' do
    post '/api/v1/managers/authenticate', params: authentication_params
    assert_json(response.body) do
      has :id, manager.id
      has :email
      has :created_at
      has :auth_token
    end
  end

  private

  def authentication_params
    { email: manager.email, password: password }
  end
end
