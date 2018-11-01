class Api::V1::AllEmployeesController < ApplicationController
  # TODO refactor to restful and move nested resources to correct namespaces and folders
  def index
    @employees = Employee.all
    render json: @employees,
           each_serializer: EmployeeSerializer
  end
end
