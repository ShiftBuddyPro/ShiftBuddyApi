class Api::V1::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]
  attr_accessor :employee

  # GET /employees
  def index
    render json: Employee.all,
           each_serializer: EmployeeSerializer
  end

  # GET /employees/1
  def show
    render json: employee,
           serializer: EmployeeSerializer
  end

  # PATCH/PUT /employees/1
  def update
    if employee.update(employee_params)
      render json: employee
    else
      render json: employee.errors,
             status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :manager_id)
  end
end
