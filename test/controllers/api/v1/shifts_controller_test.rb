require 'test_helper'

class Api::V1::ShiftsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :shift, :employee, :manager

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
  end

  test 'should show all shifts' do
    get '/api/v1/shifts'
    assert_response :success
  end

  test 'should show shift' do
    get "/api/v1/shifts/#{shift.id}"
    assert_response :success
  end

  test 'should update shift' do
    put "/api/v1/shifts/#{shift.id}", params: shift_params
    assert_response :success
  end

  test 'should delete shift' do
    assert_difference 'Shift.count', -1 do
      delete "/api/v1/shifts/#{shift.id}"
    end
    assert_response :success
  end

private

  def shift_params
    {
      shift: {
        employee_id: employee.id

      }
    }
  end
end
