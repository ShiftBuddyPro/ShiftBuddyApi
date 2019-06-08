require 'test_helper'

class Api::V1::CashDropsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :cash_drop, :shift

  setup do
    @shift = create :shift
    @cash_drop = create :cash_drop, shift: shift
  end

  test 'should show all cash_drops' do
    get '/api/v1/cash_drops'
    assert_response :success
  end

  test 'should show cash_drop' do
    get "/api/v1/cash_drops/#{cash_drop.id}"
    assert_response :success
  end

  test 'should update cash_drop' do
    put "/api/v1/cash_drops/#{cash_drop.id}", params: cash_drop_params
    assert_response :success
  end

  test 'should delete cash_drop' do
    assert_difference 'CashDrop.count', -1 do
      delete "/api/v1/cash_drops/#{cash_drop.id}"
    end
    assert_response :success
  end

  private

  def cash_drop_params
    { cash_drop: { number: 7, amount: 20.00, shift_id: shift.id } }
  end
end
