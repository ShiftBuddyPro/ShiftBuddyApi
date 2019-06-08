require 'test_helper'

class Api::V1::PaidOutsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :paid_out, :shift

  setup do
    @shift = create :shift
    @paid_out = create :paid_out, shift: shift
  end

  test 'should show all paid_outs' do
    get '/api/v1/paid_outs'
    assert_response :success
  end

  test 'should show paid_out' do
    get "/api/v1/paid_outs/#{paid_out.id}"
    assert_response :success
  end

  test 'should update paid_out' do
    put "/api/v1/paid_outs/#{paid_out.id}", params: paid_out_params
    assert_response :success
  end

  test 'should delete paid_out' do
    assert_difference 'PaidOut.count', -1 do
      delete "/api/v1/paid_outs/#{paid_out.id}"
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
