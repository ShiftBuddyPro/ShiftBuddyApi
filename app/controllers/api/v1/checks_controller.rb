class Api::V1::ChecksController < ApplicationController
  before_action :set_check, only: [:show, :update, :destroy]
  attr_accessor :check

  # GET /checks
  def index
    render json: Check.all
  end

  # GET /checks/1
  def show
    render json: check
  end

  # POST /checks
  def create
    check = Check.new(check_params)

    if check.save
      render json: check,
             status: :created
    else
      render json: check.errors,
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checks/1
  def update
    if check.update(check_params)
      render json: check
    else
      render json: check.errors,
             status: :unprocessable_entity
    end
  end

  # DELETE /checks/1
  def destroy
    check.destroy
  end

private

  def set_check
    @check = Check.find(params[:id])
  end

  def check_params
    params.require(:check).permit(:number, :company, :amount, :shift_id)
  end
end
