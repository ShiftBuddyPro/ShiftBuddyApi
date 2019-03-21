require 'test_helper'

class Api::V1::EmployeeControllerTest < ActionDispatch::IntegrationTest
  attr_reader :employee, :manager

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
  end


  test 'should show all employees' do
    get '/api/v1/employees/'
    assert_response :success
  end

  focus
  test 'should show employee' do
    get "/api/v1/employees/#{employee.id}"
    debugger
    assert_response :success
  end

  test 'should update employee' do
    put "/api/v1/employees/#{employee.id}", params: employee_params
    assert_response :success
  end

  test 'should delete employee' do
    assert_difference 'Employee.count', -1 do
      delete "/api/v1/employees/#{employee.id}"
    end
    assert_response :success
  end

private

  def employee_params
    {
      employee: {
        name: Faker::Name.first_name,
        manager_id: manager.id
      }
    }
  end
end
