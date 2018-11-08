require 'test_helper'

class Api::V1::Managers::Employees::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  attr_reader :employee, :password

  setup do
    @password = Faker::Internet.password
    @employee = create :employee, password: password
  end

  test 'should authenticate employee' do
    post '/api/v1/managers/employees/authenticate', params: authentication_params
    assert_json(@response.body) do
      has :auth_token
    end
  end

private

  def authentication_params
    {
      username: employee.username,
      password: password
    }
  end
end
