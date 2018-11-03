class Api::V1::Managers::Employees::Shifts::ChecksController < ApplicationController
  def index
    checks = Shift.find(params[:shift_id]).checks
    render json: checks.all
  end

  def create
    check = Check.new(check_params)
    if check.save
      render json: check, status: :created
    else
      render json: check.errors, status: :unprocessable_entity
    end
  end

private

  def check_params
    params.require(:check).permit(:amount, :number, :company, :shift_id)
  end
end
