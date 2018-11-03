require 'test_helper'

class Api::V1::Managers::Employees::Shifts::ChecksControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :employee, :shift, :check

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
    @check = create :check, shift: shift
  end

  test 'should get shifts cash drops' do
    get "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/checks"
    assert_response :success
    assert_json(@response.body) do
      item 0 do
        has :id, check.id
        has :amount, check.company
        has :number, check.number
        has :shift_id, shift.id
        has :created_at
        has :updated_at
      end
    end
  end

  test 'should create cash drop' do
    assert_difference 'Check.count' do
      post "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/checks", params: check_params
    end
    assert_response :success
  end

private

  def check_params
    {
      check: {
        amount: Faker::Number.number(3),
        number: Faker::Number.number(4),
        shift_id: shift.id
      }
    }
  end
end
