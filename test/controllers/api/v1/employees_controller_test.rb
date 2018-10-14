require 'test_helper'

class Api::V1::EmployeesControllerTest < ActionDispatch::IntegrationTest
  attr_reader :employee, :manager

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
  end

  test 'should create employee' do
    assert_changes 'Employee.count' do
      post "/api/v1/managers/#{manager.id}/employees", params: employee_params
    end
  end

  test 'should show employee' do
    get "/api/v1/managers/#{manager.id}/employees/#{employee.id}"
    assert_response :success
  end

  test 'should update employee' do
    put "/api/v1/managers/#{manager.id}/employees/#{employee.id}", params: employee_params
    assert_response :success
  end

  test 'should delete employee' do
    assert_difference 'Employee.count', -1 do
      delete "/api/v1/managers/#{manager.id}/employees/#{employee.id}"
    end
    assert_response :success
  end

private

  def employee_params
    {
      employee: {
        name: 'john',
        manager_id: create(:manager).id
      }
    }
  end
end
