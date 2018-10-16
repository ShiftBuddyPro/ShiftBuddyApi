require 'test_helper'

class CashDropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_drop = cash_drops(:one)
  end

  test "should get index" do
    get cash_drops_url, as: :json
    assert_response :success
  end

  test "should create cash_drop" do
    assert_difference('CashDrop.count') do
      post cash_drops_url, params: { cash_drop: { amount: @cash_drop.amount, number: @cash_drop.number, shift_id: @cash_drop.shift_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cash_drop" do
    get cash_drop_url(@cash_drop), as: :json
    assert_response :success
  end

  test "should update cash_drop" do
    patch cash_drop_url(@cash_drop), params: { cash_drop: { amount: @cash_drop.amount, number: @cash_drop.number, shift_id: @cash_drop.shift_id } }, as: :json
    assert_response 200
  end

  test "should destroy cash_drop" do
    assert_difference('CashDrop.count', -1) do
      delete cash_drop_url(@cash_drop), as: :json
    end

    assert_response 204
  end
end
