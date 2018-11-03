class Api::V1::Managers::Employees::Shifts::CashDropsController < ApplicationController
  def index
    cash_drops = Shift.find(params[:shift_id]).cash_drops
    render json: cash_drops.all
  end

  def create
    cash_drop = CashDrop.new(cash_drop_params)
    if cash_drop.save
      render json: cash_drop, status: :created
    else
      render json: cash_drop.errors, status: :unprocessable_entity
    end
  end

private

  def cash_drop_params
    params.require(:cash_drop).permit(:amount, :number, :shift_id)
  end
end
