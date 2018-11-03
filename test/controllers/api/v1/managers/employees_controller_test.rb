require 'test_helper'

class Api::V1::Managers::EmployeesControllerTest < ActionDispatch::IntegrationTest
  attr_accessor :manager, :employee, :token

  setup do
    @manager = create :manager, name: 'real one'
    @employee = create :employee, manager: manager
    sign_in manager
  end

  test 'should create new employee for specified manager' do
    assert_difference 'Employee.count' do
      post "/api/v1/managers/#{manager.id}/employees", params: employee_params
    end
    assert_response :success
  end
  focus
  test 'should get specific managers employees' do
    get "/api/v1/managers/#{manager.id}/employees"
    assert_response :success
    assert_json(@response.body) do
      item 0 do
        has :id, employee.id
        has :name, employee.name
        has :manager_id, manager.id
        has :created_at
        has :updated_at
      end
    end
  end

private

  def employee_params
    {
      employee: {
        name: 'Usman Ghani',
        manager_id: manager.id
      }
    }
  end
end
