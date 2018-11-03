class Api::V1::Managers::Employees::Shifts::PaidOutsController < ApplicationController
  def index
    paid_outs = Shift.find(params[:shift_id]).paid_outs
    render json: paid_outs.all
  end

  def create
    paid_out = PaidOut.new(paid_out_params)
    if paid_out.save
      render json: paid_out, status: :created
    else
      render json: paid_out.errors, status: :unprocessable_entity
    end
  end

private

  def paid_out_params
    params.require(:paid_out).permit(:amount, :company, :name, :shift_id)
  end
end
