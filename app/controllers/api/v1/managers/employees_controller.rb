class Api::V1::Managers::EmployeesController < ApplicationController
  attr_accessor :manager_id

  # GET /employees
  def index
    employees = Manager.find(params[:manager_id]).employees
    render json: employees.all,
           each_serializer: EmployeeSerializer
  end

  # GET /employees/1
  def show
    render json: employee,
           serializer: EmployeeSerializer
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
