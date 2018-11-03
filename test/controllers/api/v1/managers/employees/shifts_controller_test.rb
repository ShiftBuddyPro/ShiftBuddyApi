require 'test_helper'

class Api::V1::Managers::Employees::ShiftsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :shift, :employee, :manager

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
  end

  test 'should create shift' do
    assert_difference 'Shift.count' do
      post "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts"
    end
    assert_response :success
  end

  test 'should get index' do
    get "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts"
    assert_response :success
    assert_json(@response.body) do
      item 0 do
        has :id, shift.id
        has :employee_id, employee.id
        has :created_at
        has :updated_at
      end
    end
  end
end
