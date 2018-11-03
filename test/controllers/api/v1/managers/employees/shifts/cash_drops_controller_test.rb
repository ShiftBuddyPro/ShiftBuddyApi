require 'test_helper'

class Api::V1::Managers::Employees::Shifts::CashDropsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :employee, :shift, :cash_drop

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
    @cash_drop = create :cash_drop, shift: shift
    sign_in employee
  end

  test 'should get shifts cash drops' do
    get "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/cash_drops"
    assert_response :success
    assert_json(@response.body) do
      item 0 do
        has :id, cash_drop.id
        has :amount, cash_drop.amount
        has :number, cash_drop.number
        has :shift_id, shift.id
        has :created_at
        has :updated_at
      end
    end
  end

  test 'should create cash drop' do
    assert_difference 'CashDrop.count' do
      post "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/cash_drops", params: cash_drop_params
    end
    assert_response :success
  end

private

  def cash_drop_params
    {
      cash_drop: {
        amount: Faker::Number.number(3),
        number: Faker::Number.number(1),
        shift_id: shift.id
      }
    }
  end
end
