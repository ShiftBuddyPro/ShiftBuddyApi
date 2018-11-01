require 'test_helper'

class Api::V1::Managers::EmployeesControllerTest < ActionDispatch::IntegrationTest
  attr_accessor :manager, :employee

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
  end

  test "should get create" do
    get api_v1_managers_employees_create_url
    assert_response :success
  end

  test 'should get specific managers employees' do
    get "api/v1/managers/#{manager.id}/employees"
    assert_response :success
    debugger
  end
end
