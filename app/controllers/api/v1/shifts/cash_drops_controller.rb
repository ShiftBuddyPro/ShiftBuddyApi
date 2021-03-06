class Api::V1::Shifts::CashDropsController < ApplicationController
  def index
    cash_drops = Shift.find(shift_id).cash_drops
    render json: cash_drops.all
  end

  private

  def shift_id
    @shift_id ||= params[:shift_id]
  end
end
