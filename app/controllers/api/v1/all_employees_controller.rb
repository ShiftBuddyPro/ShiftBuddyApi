class Api::V1::AllEmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render json: @employees,
           each_serializer: EmployeeSerializer
  end
end
