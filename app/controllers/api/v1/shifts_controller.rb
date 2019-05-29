class Api::V1::ShiftsController < ApplicationController
  attr_accessor :shift
  before_action :set_shift, only: [:show, :update, :destroy, :complete]

  # GET /shifts
  def index
    @shifts = Shift.all

    render json: @shifts
  end

  # GET /shifts/1
  def show
    options = {}
    options[:include] = %i[paid_outs checks notes cash_drops inventory_items change_sheet]
    render json: ShiftSerializer.new(@shift, options).serialized_json, status: 200
  end

  def complete
    if shift.completed!
      render json: shift,
             status: :created
    else
      render json: shift,
             status: :unprocessable_entity
    end
  end

  # POST /shifts
  def create
    @shift = Shift.new(shift_params.merge(status: :active))

    if @shift.save
      render json: @shift,
             status: :created
    else
      render json: @shift.errors,
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shifts/1
  def update
    if @shift.update(shift_params)
      render json: @shift
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shifts/1
  def destroy
    @shift.destroy
  end

private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:employee_id)
  end
end
