require 'test_helper'

class Api::V1::ChangeSheetsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :shift, :employee

  setup do
    @employee = create :employee
    @shift = create :shift, employee: employee
    sign_in employee
  end

  test 'should get change_sheet' do
    get "/api/v1/shifts/#{shift.id}/change_sheet"
    assert_response :success

    assert_json(response.body) do
      has :id, shift.change_sheet.id
      has :shift_id, shift.id
      has :start_pennies, 0
      has :start_nickels, 0
      has :end_fives, 0
      has :end_twenties, 0
    end
  end

  test 'should update change_sheet without affecting non selected values' do
    shift.change_sheet.update(end_tens: 10)
    put "/api/v1/shifts/#{shift.id}/change_sheet", params: change_sheet_params
    assert_response :success

    assert_equal 3, shift.change_sheet.reload.start_pennies
    assert_equal 10, shift.change_sheet.end_tens
  end

private

  def change_sheet_params
    {
      change_sheet: {
        start_pennies: 3
      }
    }
  end
end
