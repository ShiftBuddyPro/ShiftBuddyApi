class Api::V1::Shifts::PaidOutsController < ApplicationController
  def index
    render json: Shift.find(shift_id).paid_outs
  end

  private

  def shift_id
    @shift_id ||= params[:shift_id]
  end
end
