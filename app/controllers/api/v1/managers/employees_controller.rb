class Api::V1::Managers::EmployeesController < ApplicationController
  attr_accessor :manager_id

  # GET /employees
  def index
    employees = Manager.find(params[:manager_id]).employees
    render json: employees.all,
           each_serializer: EmployeeSerializer
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

private

  def employee_params
    params.require(:employee).permit(:name, :manager_id)
  end
end
