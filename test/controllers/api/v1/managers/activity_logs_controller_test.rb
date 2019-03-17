require 'test_helper'

class Api::V1::Managers::ActivityLogsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :employee, :shift, :employee2, :shift2

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
    @note = create :note, shift: shift
    @employee2 = create :employee, manager: manager
    @shift2 = create :shift, employee: employee2
    @note2 = create :note, shift: shift2
    @paid_out = create :paid_out, shift: shift2
    @check = create :check, created_at: Time.now + 1.minute, shift: shift2
  end

  focus
  test "should show manager's activities" do
    get "/api/v1/managers/#{manager.id}/activity_logs"
    assert_response :success
    activities = JSON.parse(response.body)
    assert_equal 4, activities.length
    assert activities.first.include? 'check'
    assert activities.second.include? 'paid out'
    assert activities.third.include? 'note'
    assert activities.fourth.include? 'note'
  end
end
