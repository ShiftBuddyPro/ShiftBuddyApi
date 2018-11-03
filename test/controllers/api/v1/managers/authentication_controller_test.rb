require 'test_helper'

class Api::V1::Managers::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :password

  setup do
    @password = Faker::Internet.password
    @manager = create :manager, password: password
  end

  test 'should authenticate manager' do
    post '/api/v1/managers/authenticate', params: authentication_params
    assert_json(@response.body) do
      has :auth_token
    end
  end

private

  def authentication_params
    {
      email: manager.email,
      password: password
    }
  end
end
