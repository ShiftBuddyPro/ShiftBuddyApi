require 'test_helper'

class ChecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check = create :check
  end

  test "should get index" do
    get checks_url, as: :json
    assert_response :success
  end

  test "should create check" do
    assert_difference('Check.count') do
      post checks_url, params: { check: { amount: @check.amount, company: @check.company, number: @check.number, shift_id: @check.shift_id } }, as: :json
    end

    assert_response 201
  end

  test "should show check" do
    get check_url(@check), as: :json
    assert_response :success
  end

  test "should update check" do
    patch check_url(@check), params: { check: { amount: @check.amount, company: @check.company, number: @check.number, shift_id: @check.shift_id } }, as: :json
    assert_response 200
  end

  test "should destroy check" do
    assert_difference('Check.count', -1) do
      delete check_url(@check), as: :json
    end

    assert_response 204
  end
end
