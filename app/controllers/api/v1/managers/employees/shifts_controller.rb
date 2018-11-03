class Api::V1::Managers::Employees::ShiftsController < ApplicationController
  attr_accessor :employee_id

  # GET /shifts
  def index
    shifts = Employee.find(params[:employee_id]).shifts
    render json: shifts.all,
           each_serializer: EmployeeSerializer
  end

  # POST /shifts
  def create
    @shift = Shift.new(employee_id: params[:employee_id])

    if @shift.save
      render json: @shift, status: :created
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end
end
