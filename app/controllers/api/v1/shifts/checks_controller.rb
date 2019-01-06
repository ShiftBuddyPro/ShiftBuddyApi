class Api::V1::Shifts::ChecksController < ApplicationController
  def index
    checks = Shift.find(params[:shift_id]).checks
    render json: checks.all
  end
end
