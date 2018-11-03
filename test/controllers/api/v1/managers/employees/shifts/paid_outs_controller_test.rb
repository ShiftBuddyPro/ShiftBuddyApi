require 'test_helper'

class Api::V1::Managers::Employees::Shifts::InventoryItemsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :employee, :shift, :paid_out

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
    @paid_out = create :paid_out, shift: shift
  end

  test 'should get shifts paid outs' do
    get "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/paid_outs"
    assert_response :success
    assert_json(@response.body) do
      item 0 do
        has :id, paid_out.id
        has :amount, paid_out.amount
        has :company, paid_out.company
        has :shift_id, shift.id
        has :created_at
        has :updated_at
      end
    end
  end

  test 'should create paid out' do
    assert_difference 'InventoryItem.count' do
      post "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/paid_outs", params: paid_out_params
    end
    assert_response :success
  end

private

  def paid_out_params
    {
      paid_out: {
        company: Faker::Company.name,
        amount: Faker::Number.number(2),
        shift_id: shift.id
      }
    }
  end
end
