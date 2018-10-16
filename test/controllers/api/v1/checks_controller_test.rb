require 'test_helper'

class Api::V1::ChecksControllerTest < ActionDispatch::IntegrationTest
  attr_reader :check, :shift
  delegate :employee, to: :shift
  delegate :manager, to: :employee

  setup do
    @shift = create :shift
    @check = create :check, shift: shift
  end

  test 'should create check' do
    assert_changes 'Check.count' do
      post "/api/v1/shifts/#{shift.id}/checks", params: check_params
    end
  end

  test 'should show all checks' do
    get "/api/v1/shifts/#{shift.id}/checks"
    assert_response :success
  end

  test 'should show check' do
    get "/api/v1/checks/#{check.id}"
    assert_response :success
  end

  test 'should update check' do
    put "/api/v1/checks/#{check.id}", params: check_params
    assert_response :success
  end

  test 'should delete check' do
    assert_difference 'Check.count', -1 do
      delete "/api/v1/checks/#{check.id}"
    end
    assert_response :success
  end

private

  def check_params
    {
      check: {
        company: Faker::Company.name,
        amount: Faker::Commerce.price,
        number: Faker::Number.number(4),
        shift_id: shift.id
      }
    }
  end
end
